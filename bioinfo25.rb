require 'bio'

ncbi = Bio::NCBI::REST.new

ncbi.efetch("FJ817486", {"db"=>"nucleotide","rettype"=>"fasta"})
