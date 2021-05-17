class PetsController < ApplicationController

  get '/pets' do
    @pets = Pet.all
    erb :'/pets/index' 
  end

  get '/pets/new' do 
    erb :'/pets/new'
  end

  post '/pets' do 
    @pets = Pet.create(params[:pet])
    if !params["owner"]["name"].empty?
      @pet.owner << Owner.create(name: params["pet"]["name"])
    end
    redirect to "pets/#{@pet.id}"
  end

  get '/pets/:id' do 
    @pet = Pet.find(params[:id])
    erb :'/pets/show'
  end

  patch '/pets/:id' do 
  ####### bug fix
  if !params[:pets].keys.include?("owner_ids")
    params[:pet]["owner_ids"] = []
    end
    #######

    @pet = Pet.find(params[:id])
    @pet.update(params["owner"])
    if !params["owner"]["name"].empty?
      @pets.owner << owner.create(name: params["owner"]["name"])
    end
    redirect to "pets/#{@pet.id}"
  end
end