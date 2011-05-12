gem "bookie", ">= 0.0.12"
require "bookie"

MANUSCRIPT_DIR = "#{File.dirname(__FILE__)}/manuscript/"

book = Bookie::Book.new("Ruby Objects, Classes, and Modules")

book.chapter "The Nature of Objects", "#{MANUSCRIPT_DIR}/001_nature_of_objects.md"
book.chapter "The Mixin Concept", "#{MANUSCRIPT_DIR}/002_mixins.md"

book.render("rocm", [Bookie::Emitters::PDF.new])
