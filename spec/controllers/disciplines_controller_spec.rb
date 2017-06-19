require 'rails_helper'

RSpec.describe DisciplinesController, type: :controller do
  def responde_ok
    expect(response).to have_http_status(200)
  end

  describe 'GET #index' do

    let(:user) {
      User.create!(
        email: 'email@email.com',
        password: '123456',
        name: 'Fulano',
        login: 'username',
        admin: false
      )
    }

    let(:discipline) { Discipline.create! id: 1, name: 'APC' }

    it 'Responde 200 OK' do
      responde_ok
    end

    it 'Renderiza a página index das Disciplinas' do
      sign_in user
      get :index, params: { id: discipline.id }
      expect(response).to render_template('index')
    end

    it 'Carrega todas as disciplinas' do
      sign_in user

      discipline1, discipline2 = Discipline.create(name: 'teste1'), Discipline.create(name: 'teste2')
      get :index
      expect(assigns(:disciplines)).to match_array([discipline1, discipline2])
    end
  end

  describe 'GET #show' do
    it 'Responde 200 OK' do
      responde_ok
    end

    it 'Renderiza a página show' do
      Discipline.create(name: 'teste1')
      get :show, params: { id: 1 }
      expect(response).to render_template('show')
    end
  end

  describe 'GET #new' do
    it 'Responde 200 OK' do
      responde_ok
    end

    it 'Renderiza a página new' do
      get :new
      expect(response).to render_template('new')
    end
  end

  describe 'GET #edit' do
    it 'Responde 200 OK' do
      responde_ok
    end

    it 'Renderiza a página edit' do
      Discipline.create(name: 'teste')
      get :edit, params: { id: 1 }
      expect(response).to render_template('edit')
    end
  end

  describe 'GET #create' do
    context 'Parâmetros válidos' do
      it 'Cria um usuário' do
        expect {
          post :create, params: {
            discipline: {
              name: 'teste1'
            }
          }
        }.to change(Discipline, :count).by(1)
      end

      it 'Redirecionar para show' do
        post :create, params: {
          discipline: {
            name: 'teste1'
          }
        }
        expect(response).to redirect_to Discipline.last
      end
    end
  end

  describe 'PATCH/PUT #update' do
    it 'Atualizar via put' do
      Discipline.create(id: 1, name: 'teste1')
      put :update, params: {
        id: 1,
        discipline: {
          name: 'teste2'
        }
      }
      expect(Discipline.find(1).name).to eq('teste2')
    end

    it 'Atualizar via patch' do
      Discipline.create(id: 1, name: 'teste1')
      put :update, params: {
        id: 1,
        discipline: {
          name: 'teste2'
        }
      }
      expect(Discipline.find(1).name).to eq('teste2')
    end
  end

  describe 'DELETE #delete' do
    it 'Remover disciplina' do
      Discipline.create(id: 1, name: 'teste1')
      expect {
        delete :destroy, params: {
          id: 1
        }
      }.to change(Discipline, :count).by(-1)
    end
  end
end
