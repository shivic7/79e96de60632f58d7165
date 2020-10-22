class UserController < ApplicationController

	def get_all_users
		users = ""
		if params[:id].present?
			users = Users.where(id: params[:id]).last
		else
			users = Users.all
		end
		response["user_data"] = users
		render json: {success: true, user_data: users}
	end

	def add_user
		user = []
		if params[:first_name].present? && params[:last_name].present? && params[:email].present?
			data = {}
	    data["first_name"] = params[:first_name]
	    data["last_name"] = params[:last_name]
	    data["email"] = params[:email]
	    user = Users.create_user_data(data)
	  end
		render json: {user_data: user}
	end

	def update_user
		user = []
		if params[:id].present? 
			user = Users.where(id: params[:id]).last
			if user.present?
				user.update_attributes!(first_name: params[:first_name].presence || user.first_name, last_name: params[:last_name].presence || user.last_name, email: params[:email].presence || user.email)
			end
	  end
		render json:{user_data: user}
	end

	def delete_user
		if params[:id].present? 
			user = Users.where(id: params[:id]).last
			if user.present?
				user.delete
			end
	  end
		render json:{user_data: []}
	end

	def typehead
		user = []
		arr =[]
		if params[:input].present? 
			user = Users.where( first_name: /#{params[:input]}/) + Users.where( last_name: /#{params[:input]}/) + Users.where( email: /#{params[:input]}/)
			if user.present?
				user = user.as_json
				user.select{|a| arr << a["first_name"] +" " +a["last_name"]}
			end
	  end
		render json:{user_data: arr}
	end

end
