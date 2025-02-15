# frozen_string_literal: true

require "yaml"

module Twemoji
  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configuration=(configuration)
    @configuration = configuration
  end

  def self.configure
    yield configuration
  end

  def self.load_yaml(path)
    YAML.safe_load(IO.read(path))
  end

  class Configuration
    DATA_DIR = File.join(File.dirname(__FILE__), "data")
    CODE_MAP_FILE = File.join(DATA_DIR, "emoji-unicode.yml")
    PNG_MAP_FILE = File.join(DATA_DIR, "emoji-unicode-png.yml")
    SVG_MAP_FILE = File.join(DATA_DIR, "emoji-unicode-svg.yml")
    DEFAULT_ASSET_ROOT = "https://cdn.jsdelivr.net/gh/twitter/twemoji@14.0.2/assets"

    attr_accessor :asset_root, :file_ext, :class_name, :img_attrs

    def initialize
      @asset_root = DEFAULT_ASSET_ROOT
      @file_ext   = "svg"
      @class_name = "emoji"
      @img_attrs  = {}
    end
  end
end
