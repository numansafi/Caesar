API_HOST = "https://api.yelp.com"
SEARCH_PATH = "/v3/businesses/search"
BUSINESS_PATH = "/v3/businesses/"
DEFAULT_BUSINESS_ID = "yelp-san-francisco"
DEFAULT_TERM = "dinner"
DEFAULT_LOCATION = "San Francis6co, CA"
SEARCH_LIMIT = 20

API_KEY = ENV["YELP_API_KEY"]

class YelpApiAdapter

    def self.search(term, location)
        url = "#{API_HOST}#{SEARCH_PATH}"
        params = {
        term: term,
        location: location,
        limit: SEARCH_LIMIT
        }

        response = HTTP.auth("Bearer #{API_KEY}").get(url, params: params)
        response.parse
    end

    def self.business(business_id)
        url = "#{API_HOST}#{BUSINESS_PATH}#{business_id}"
        response = HTTP.auth("Bearer #{API_KEY}").get(url)
        response.parse
    end

    def business_reviews(business_id)
        url = "#{API_HOST}#{BUSINESS_PATH}#{business_id}/reviews"
        response = HTTP.auth("Bearer #{API_KEY}").get(url)
        response.parse["reviews"]
    end

end
