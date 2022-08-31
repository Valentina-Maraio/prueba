class MainController < ApplicationController
    def index
        require 'net/http'
        require 'json' 
        @url = 'https://rickandmortyapi.com/api/character'
        @uri = URI(@url)
        @response = Net::HTTP.get(@uri)
        @results = JSON.parse(@response)

        #error
        if @results.empty?
            @empty_result = "Choose another character"
        elsif !@results
            @empty_result = "Choose another character"
        else
            @empty_result = @results['results'][0]['name']
        end

        #type
        if @results['results'][0]['type'].empty?
            @no_type = 'No type'
        else
            @no_type = @results['results'][0]['type']
        end
    end
end