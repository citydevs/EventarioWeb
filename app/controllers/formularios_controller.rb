class FormulariosController < ApplicationController
  def por_post
   @respuesta = false;
   if request.post?
      @comentario = {
         :nombre => params[:nombre],
         :consulta => params[:comentario],
         :lugar => params[:lugar],
         :direccion => params[:direccion]
      };
   end
 end
end
