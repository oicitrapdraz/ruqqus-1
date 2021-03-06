module Ruqqus

  ##
  # Represents a Ruqqus guild.
  class Guild < ItemBase

    ##
    # @return [String] the name of the guild.
    def name
      @data[:name]
    end

    ##
    # @return [Integer] the number of members subscribed to the guild.
    def member_count
      @data[:subscriber_count]&.to_i || 0
    end

    ##
    # @return [Integer] the number of guild masters who moderate this guild.
    def gm_count
      @data[:mods_count]&.to_i || 0
    end

    ##
    # @return [String] the full ID of the guild.
    def full_name
      @data[:fullname]
    end

    ##
    # @return [Boolean] `true` if the guild contains adult content and flagged as NSFW, otherwise `false`.
    def nsfw?
      @data[:over_18]
    end

    ##
    # @return [Boolean] `true` if guild is private and required membership to view content, otherwise `false`.
    def private?
      !!@data[:is_private]
    end

    ##
    # @return [Boolean] `true` if posting is restricted byy guild masters, otherwise `false`.
    def restricted?
      !!@data[:is_restricted]
    end

    ##
    # @return [String] the description of the guild.
    def description
      @data[:description]
    end

    ##
    # @return [String] the description of the guild in HTML format.
    def description_html
      @data[:description_html]
    end

    ##
    # @return [String] the URL for the banner image associated with the guild.
    def banner_url
      @data[:banner_url]
    end

    ##
    # @return [String] the URL for the profile image associated with the guild.
    def profile_url
      @data[:profile_url]
    end

    ##
    # @return [String] the accent color used for the guild, in HTML format.
    def color
      @data[:color]
    end

    ##
    # @return [String] the string representation of the object.
    def to_s
      @data[:name] || inspect
    end
  end
end