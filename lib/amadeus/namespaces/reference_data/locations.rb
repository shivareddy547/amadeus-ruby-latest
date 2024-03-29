# frozen_string_literal: true

module Amadeus
  module Namespaces
    class ReferenceData
      # A namespaced client for the
      # +/v2/reference-data/locations+ endpoints
      #
      # Access via the +Amadeus::Client+ object
      #
      #   amadeus = Amadeus::Client.new
      #   amadeus.reference_data.locations
      #
      class Locations < Amadeus::Client::Decorator
        # The namespace for the Airports API:
        #
        # @return [Amadeus::Namespaces::ReferenceData::Locations::Airports]
        # @example
        #   amadeus.reference_data.locations.airports
        #
        def airports
          Amadeus::Namespaces::ReferenceData::Locations::Airports.new(client)
        end

        # The namespace for the Points Of Interest API:
        #
        # @return [Amadeus::Namespaces::ReferenceData::Locations::PointsOfInterest]
        # @example
        #   amadeus.reference_data.locations.points_of_interest
        #
        def points_of_interest
          Amadeus::Namespaces::ReferenceData::Locations::PointsOfInterest.new(client)
        end

        def cities
          Amadeus::Namespaces::ReferenceData::Locations::Cities.new(client)
        end

        def hotels_by_city
          Amadeus::Namespaces::ReferenceData::Locations::HotelsByCity.new(client)
        end

        # The namespace for the Point Of Interest API:
        #
        # @return [Amadeus::Namespaces::ReferenceData::Locations::PointOfInterest]
        # @example
        #   amadeus.reference_data.locations.point_of_interest
        #
        def point_of_interest(location_id)
          Amadeus::Namespaces::ReferenceData::Locations::PointOfInterest.new(
            client, location_id
          )
        end

        # Returns a list of airports and cities matching a given keyword.
        #
        # @option params [String] :keyword keyword that should represent the
        #   start of a word in a city or airport name or code
        # @option params [String] :subType the {Amadeus::Location} to
        #   search for
        # @return [Amadeus::Response] a parsed response
        # @raise [Amadeus::Base] an exception if the call failed
        # @example Find any location starting with 'lon'
        #   amadeus.reference_data.locations.get(
        #     keyword: 'lon',
        #     subType: Amadeus::Location::ANY
        #   )
        #
        def get(params = {})
          client.get('/v1/reference-data/locations', params)
        end
      end
    end
  end
end
