class MetalAssociatesController < ApplicationController
   def show
   end
   
   def edit
       @metal = Metal.find(params[:metal_id])
       @metals = Metal.all
   end
   
   def update
       @metal = Metal.find(params[:metal_id])
   end
   
   def new
       @metal = Metal.find(params[:metal_id])
   end
   
   def create
       @metal = Metal.find(params[:metal_id])
       metal_pairing = metal_associate_params
       metal_pairing = metal_pairing['metal_associating_ids']
       update_metal = @metal
       update_metal.metal_associates = []
       metal_pairing.each do |pair|
          if pair != "" 
            update_metal.metal_associates << Metal.find(pair)
         end
       end
      @metal = update_metal
      @metal.save
      redirect_to metal_path(@metal)
   end
   
   def destroy
   end
   
   private
   def metal_associate_params
      params.require(:metal_associate).permit(metal_associating_ids: [])
   end
end