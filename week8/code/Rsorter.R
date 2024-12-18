# Code to sort my FASTA files
fasta_file <- "~/Documents/CMEECourseWork/week8/data/FASTA.txt"

fasta_lines <- readLines(fasta_file)

# Initialize variables
current_name <- NULL
sequences <- list()

# Parse the fasta file
for (line in fasta_lines) {
  if (startsWith(line, ">")) {
    # Header line: Extract the name and remove '>'
    current_name <- gsub("\\s+", "_", substring(line, 2)) # Replace spaces with underscores
    sequences[[current_name]] <- "" # Initialize an empty sequence
  } else {
    # Sequence line: Append to the current sequence
    sequences[[current_name]] <- paste0(sequences[[current_name]], line)
  }
}

# Assign each sequence to an object in the global environment
for (name in names(sequences)) {
  assign(name, sequences[[name]], envir = .GlobalEnv)
}

# Now you can just: > head(sequences[1,2,3...]) and write_clip(sequences[[1]])
# also do library(clipr) first