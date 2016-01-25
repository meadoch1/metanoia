defmodule Metanoia.RelationRender do
  defmacro __using__(_opts) do
    quote do
      
      def render_relation(map, _key, %Ecto.Association.NotLoaded{}, _view, _name) do
        map
      end

      def render_relation(map, _key, nil, _view, _name) do
        map
      end

      def render_relation(map, key, relation, view, name) do
        Map.put(map, key, render_one(relation, view, name))
      end
    end
  end
end
