require 'pry'

# Completed in 60 minutes
class InvalidCodonError < StandardError
end

class Translation
  CODON_KEY = {
    'AUG' => 'Methionine', 'UUU' => 'Phenylalanine', 'UUC' => 'Phenylalanine',
    'UUA' => 'Leucine', 'UUG' => 'Leucine', 'UCU' => 'Serine',
    'UCC' => 'Serine', 'UCA' => 'Serine', 'UCG' => 'Serine',
    'UAU' => 'Tyrosine', 'UAC' => 'Tyrosine', 'UGU' => 'Cysteine',
    'UGC' => 'Cysteine', 'UGG' => 'Tryptophan', 'UAA' => 'STOP',
    'UAG' => 'STOP', 'UGA' => 'STOP'
  }

  def self.of_codon(codon)
    CODON_KEY.fetch(codon) { fail InvalidCodonError }
  end

  def self.of_rna(strand)
    amino_acids = []
    strand.scan(/\w{3}/).each do |codon|
      if of_codon(codon) == 'STOP'
        break
      else
        amino_acids << of_codon(codon)
      end
    end
    amino_acids
  end
end
