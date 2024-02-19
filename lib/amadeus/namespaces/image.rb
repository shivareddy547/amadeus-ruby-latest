# python
require 'net/http'
require 'json'

def get_place_id(google_key, headers)
    p 11111111111
    hotel_name = 'HOTEL VILLA PANTHEON'
    lat_lng = '48.84917,2.34615'
    base_url = 'https://maps.googleapis.com/maps/api/place/textsearch/json'
    params = '?location=' + lat_lng + '&query=' + hotel_name + '&radius=10&key=' + google_key
    url = base_url + params
    p 222222222
    p uri = URI(url)
    p 333333
    p response = Net::HTTP.get(uri)
    p 444444444
    json_response = JSON.parse(response)
    place_id = json_response['results'][0]['place_id']
    return place_id
end

def place_details(google_key, headers, place_id)
    url = 'https://maps.googleapis.com/maps/api/place/details/json?place_id=' + place_id + '&key=' + google_key
    uri = URI(url)
    response = Net::HTTP.get(uri)
    json_response = JSON.parse(response)
    photo_references = []
    for i in 0..(json_response['result']['photos'].length - 1)
        photo_references.push(json_response['result']['photos'][i]['photo_reference'])
    end
    return photo_references
end

def place_photos(google_key, photo_reference)
    url = 'https://maps.googleapis.com/maps/api/place/photo?photo_reference=' + photo_reference + '&key=' + google_key
    uri = URI(url)
    response = Net::HTTP.get(uri)
    puts response
end

def main()
    google_key = 'AIzaSyBLOi3tHMIf8Y8JU57KZt5CmCGcqWgZVqE'
    headers = { 'Accept' => 'image/*' }
    get_place_id(google_key, headers)
    place_details(google_key, headers, place_id)
    place_photos(google_key, photo_reference)
end

main()
