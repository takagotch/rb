class EntriesController < ApplicationController
  def create
    @entry = Entry.new(params[:entry])
	if @entry.save
	  ...
	end
  end
  ...
  