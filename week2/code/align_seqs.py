import sys
import csv
import os

# Function to read sequences from a CSV file
def read_sequences(filename):
    with open(filename, 'r') as file:
        reader = csv.reader(file)
        sequences = [row[0] for row in reader]  # Assumes each sequence is in a separate row
    return sequences[0], sequences[1]

# Function to calculate the alignment score
def calculate_score(s1, s2, l1, l2, startpoint):
    score = 0
    matched = ""
    for i in range(l2):
        if (i + startpoint) < l1 and s1[i + startpoint] == s2[i]:
            matched += "*"
            score += 1
        else:
            matched += "-"
    return score, "." * startpoint + matched

# Function to find the best alignment
def find_best_align(seq1, seq2):
    l1, l2 = len(seq1), len(seq2)
    # Ensure s1 is the longer sequence
    if l1 >= l2:
        s1, s2 = seq1, seq2
    else:
        s1, s2 = seq2, seq1
        l1, l2 = l2, l1

    best_align = ""
    best_score = -1
    for i in range(l1):
        score, alignment = calculate_score(s1, s2, l1, l2, i)
        if score > best_score:
            best_score = score
            best_align = "." * i + s2

    return best_align, s1, best_score

# Function to write alignment and score to a file in the ../results directory
def write_align(filename, best_align, s1, best_score):
    # Define output path in the parent results directory
    output_path = os.path.join("..", "results", filename)
    with open(output_path, 'w') as file:
        file.write(f"Best alignment:\n{best_align}\n{s1}\n")
        file.write(f"Best score: {best_score}\n")
    return output_path

# Main execution block
if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python align_seqs.py <filename.csv>")
        sys.exit(1)
    
    input_file = sys.argv[1]
    output_filename = "alignment_result!.txt"
    
    try:
        # Read sequences from input CSV file
        seq1, seq2 = read_sequences(input_file)
        
        # Find the best alignment and score
        best_align, s1, best_score = find_best_align(seq1, seq2)
        
        # Write the result to the output file in the ../results directory
        output_path = write_align(output_filename, best_align, s1, best_score)
        print(f"Best alignment and score saved to {output_path}")
    
    except Exception as e:
        print(f"Error: {e}")

