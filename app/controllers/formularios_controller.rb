require 'pg'
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
      #Abre conexion
      
      #inserta
      #Cierra

   end
 end
end
