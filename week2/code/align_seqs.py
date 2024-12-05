#!/usr/bin/env python3
# Author: Sean Barry sb4524@ic.ac.uk
# Date: Oct 2024

"""
align_seqs.py
This script reads two sequences from a CSV file, finds the best alignment, 
and saves the alignment and its score to a results file.

Usage:
    python align_seqs.py <filename.csv>

The input CSV file must contain two sequences, each in a separate row.
The output file is saved in the `../results` directory.
"""

import sys
import csv
import os

def read_sequences(filename):
    """
    Read two sequences from a CSV file.

    Parameters:
    filename (str): Path to the input CSV file.

    Returns:
    tuple: Two sequences (str) from the file.
    """
    if not os.path.exists(filename):
        raise FileNotFoundError(f"Input file '{filename}' not found.")
    
    with open(filename, 'r') as file:
        reader = csv.reader(file)
        sequences = [row[0] for row in reader]  # Assumes each sequence is in a separate row
    
    if len(sequences) < 2:
        raise ValueError("Input file must contain at least two sequences.")
    
    return sequences[0], sequences[1]


def calculate_score(s1, s2, l1, l2, startpoint):
    """
    Calculate the alignment score for a given startpoint.

    Parameters:
    s1, s2 (str): The sequences to align.
    l1, l2 (int): Lengths of the sequences.
    startpoint (int): The starting point for alignment.

    Returns:
    tuple: The score (int) and the alignment string (str).
    """
    score = 0
    matched = ""
    for i in range(l2):
        if (i + startpoint) < l1 and s1[i + startpoint] == s2[i]:
            matched += "*"
            score += 1
        else:
            matched += "-"
    return score, "." * startpoint + matched


def find_best_align(seq1, seq2):
    """
    Find the best alignment and its score.

    Parameters:
    seq1, seq2 (str): The sequences to align.

    Returns:
    tuple: Best alignment (str), the longer sequence (str), and the best score (int).
    """
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
            best_align = alignment

    return best_align, s1, best_score


def write_alignment(output_path, best_align, s1, best_score):
    """
    Write the best alignment and score to a file.

    Parameters:
    output_path (str): Path to the output file.
    best_align (str): The best alignment string.
    s1 (str): The longer sequence.
    best_score (int): The best alignment score.
    """
    os.makedirs(os.path.dirname(output_path), exist_ok=True)
    with open(output_path, 'w') as file:
        file.write(f"Best alignment:\n{best_align}\n{s1}\n")
        file.write(f"Best score: {best_score}\n")
    print(f"Best alignment and score saved to {output_path}")


def main(argv):
    """
    Main function to handle input, processing, and output.
    """
    if len(argv) != 2:
        print("Usage: python align_seqs.py <filename.csv>")
        sys.exit(1)
    
    input_file = argv[1]
    output_file = "../results/alignment_result.txt"

    try:
        # Read sequences from input CSV file
        seq1, seq2 = read_sequences(input_file)
        
        # Find the best alignment and score
        best_align, s1, best_score = find_best_align(seq1, seq2)
        
        # Write the result to the output file
        write_alignment(output_file, best_align, s1, best_score)
    
    except FileNotFoundError as e:
        print(f"Error: {e}")
    except ValueError as e:
        print(f"Error: {e}")
    except Exception as e:
        print(f"An unexpected error occurred: {e}")


if __name__ == "__main__":
    main(sys.argv)
