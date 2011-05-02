gem "bookie", ">= 0.0.11"
require "bookie"

MANUSCRIPT_DIR = "#{File.dirname(__FILE__)}/manuscript/"

book = Bookie::Book.new("Ruby Objects, Classes, and Modules")

book.chapter "The Nature of Objects", "#{MANUSCRIPT_DIR}/001_nature_of_objects.md"

book.render("rocm", [Bookie::Emitters::PDF.new])
