defmodule CoreWeb.Schema do
  use Absinthe.Schema
  import_types CoreWeb.Schema.Types.Conference
  import_types CoreWeb.Schema.Types.User

  query do
    field :conferences, list_of(:conference) do
      resolve &CoreWeb.Resolvers.ConferenceResolver.all/2
    end

    field :conference, type: :conference do
      arg :id, non_null(:id)
      resolve &CoreWeb.Resolvers.ConferenceResolver.get/2
    end

    field :users, list_of(:user) do
      resolve &CoreWeb.Resolvers.UserResolver.all/2
    end

    field :user, type: :user do
      arg :id, non_null(:id)
      resolve &CoreWeb.Resolvers.UserResolver.get/2
    end
  end

  mutation do
    @desc "Create a conference"
    field :create_conference, type: :conference do
      arg :name, non_null(:string)
      arg :description, :string
      arg :start_time, :naive_datetime
      arg :end_time, :naive_datetime
  
      resolve &CoreWeb.Resolvers.ConferenceResolver.create/2
    end

    @desc "Update a conference"
    field :update_conference, type: :conference do
      arg :id, non_null(:id)
      arg :name, non_null(:string)
      arg :description, :string
      arg :start_time, :naive_datetime
      arg :end_time, :naive_datetime
  
      resolve &CoreWeb.Resolvers.ConferenceResolver.update/2
    end

    @desc "Create a user"
    field :create_user, type: :user do
      arg :first_name, non_null(:string)
  
      resolve &CoreWeb.Resolvers.UserResolver.create/2
    end

    @desc "Update a user"
    field :update_user, type: :user do
      arg :id, non_null(:id)
      arg :first_name, non_null(:string)
  
      resolve &CoreWeb.Resolvers.UserResolver.update/2
    end
  end

  # Publishing in iex -S:
  # Absinthe.Subscription.publish(CoreWeb.Endpoint, Core.Repo.get(Core.Events.Conference, 5), new_conference: "XXXXXX")

  subscription do
    field :new_conference, :conference do
      arg :name, non_null(:string)
  
      config fn args, _info ->
        {:ok, topic: args.name}
      end

      trigger :create_conference, topic: fn conference ->
        conference.name
      end
    end
  end
end