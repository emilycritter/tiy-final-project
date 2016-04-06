require "test_helper"

class ArtworkTest < ActiveSupport::TestCase
  def artwork
    @artwork ||= Artwork.new
  end

  def test_valid
    assert artwork.valid?
  end
end
