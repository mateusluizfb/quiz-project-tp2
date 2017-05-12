require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  def responde_ok
    expect(response).to have_http_status(200)
  end

  describe 'GET #index' do

    it 'Responde 200 OK' do
        responde_ok
    end

    it 'Obtem todos os Users' do
      user1 = User.create(name: 'Fulano', email: 'fulado@gmail.com', login: 'fulano', password: '123456' )
      user2 = User.create(name: 'Ciclano', email: 'ciclano@gmail.com', login: 'ciclano', password: '123456', admin: true )
      get :index, session: { user_id: 2 }
      expect(assigns(:users)).to match_array([user1, user2])
    end

  end

end
