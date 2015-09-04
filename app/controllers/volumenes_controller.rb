class VolumenesController < ApplicationController
  def index
    @volumen = Volumen.all

    #respond_to do |format|
      #format.html
      #format.csv {render text: @volumen.to_csv }
    #end
  	@search = VolumenSearch.new(params[:search])
    @volumen = @search.scope
    

  end

  def show
  end

  #def import
   # Volumen.import(params[:file])
   # redirect_to volumen_path, notice: 'Datos subidos.'
  #end

  private

	def volumen_params
		params.require(:volumen).permit(:tipo_de_volumen, :valor_volumen, :medio_id, :ordene_id, :rango, :escala)
	end
end
