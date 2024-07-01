defmodule ImdbWeb.PipeControllerTest do
  use ImdbWeb.ConnCase

  import Imdb.PipesFixtures

  alias Imdb.Pipes.Pipe

  @create_attrs %{
    name: "some name"
  }
  @update_attrs %{
    name: "some updated name"
  }
  @invalid_attrs %{name: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all pipes", %{conn: conn} do
      conn = get(conn, ~p"/api/pipes")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create pipe" do
    test "renders pipe when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/pipes", pipe: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/pipes/#{id}")

      assert %{
               "id" => ^id,
               "name" => "some name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/pipes", pipe: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update pipe" do
    setup [:create_pipe]

    test "renders pipe when data is valid", %{conn: conn, pipe: %Pipe{id: id} = pipe} do
      conn = put(conn, ~p"/api/pipes/#{pipe}", pipe: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/pipes/#{id}")

      assert %{
               "id" => ^id,
               "name" => "some updated name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, pipe: pipe} do
      conn = put(conn, ~p"/api/pipes/#{pipe}", pipe: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete pipe" do
    setup [:create_pipe]

    test "deletes chosen pipe", %{conn: conn, pipe: pipe} do
      conn = delete(conn, ~p"/api/pipes/#{pipe}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/pipes/#{pipe}")
      end
    end
  end

  defp create_pipe(_) do
    pipe = pipe_fixture()
    %{pipe: pipe}
  end
end
