require 'rails_helper'

RSpec.describe TopicsController, type: :controller do

  def responde_ok
    expect(response).to have_http_status(200)
  end

  describe 'GET #index' do

    it 'Responde 200 OK' do
      responde_ok
    end

    it 'Renderiza página indes dos Tópicos' do
      get :index
      expect(response).to render_template('index')
    end

    it 'Carrega todos os tópicos' do
      topic1, topic2 = Topic.create(name: 'nome1'), Topic.create(name: 'nome2')
      get :index
      expect(assigns(:topics)).to match_array([topic1, topic2])
    end

  end

  describe 'GET #show' do

    it 'Responde 200 OK' do
      responde_ok
    end

    it 'Renderiza página show' do
      Topic.create(name: 'nome1')
      get :show, params: { id: 1 }
      expect(response).to render_template('show')
    end

    describe 'GET #edit' do

      it 'Responde 200 OK' do
        responde_ok
      end

      it 'Renderiza a página edit' do
        Topic.create(name: 'teste')
        get :edit, params: { id: 1 }
        expect(response).to render_template('edit')
      end

    end

    describe 'GET #create' do
      context 'Parâmetros válidos' do

        it 'Cria um usuário' do
          expect {
            post :create, params: {
              topic: {
                name: 'teste1'
              }
            }
          }.to change(Topic, :count).by(1)
        end

        it 'Redirecionar para show' do
          post :create, params: {
            topic: {
              name: 'teste1'
            }
          }
          expect(response).to redirect_to Topic.last
        end

      end
    end

    describe 'PATCH/PUT #update' do

      it 'Atualizar via put' do
        Topic.create(id: 1, name: 'teste1')
        put :update, params: {
          id: 1,
          topic: {
            name: 'teste2'
          }
        }
        expect(Topic.find(1).name).to eq('teste2')
      end

      it 'Atualizar via patch' do
        Topic.create(id: 1, name: 'teste1')
        put :update, params: {
          id: 1,
          topic: {
            name: 'teste2'
          }
        }
        expect(Topic.find(1).name).to eq('teste2')
      end

    end

    describe 'DELETE #delete' do

      it 'Remover disciplina' do
        Topic.create(id: 1, name: 'teste1')
        expect {
          delete :destroy, params: {
            id: 1
          }
        }.to change(Topic, :count).by(-1)
      end


  end

end
