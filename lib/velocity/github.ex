defmodule Velocity.GitHub do
  defp key, do: Application.get_env(:velocity, :github_api_key)
  defp base_url, do: Application.get_env(:velocity, :github_api_url, "https://api.github.com")

  defp get(endpoint, params \\ %{}) do
    api_key = key()
    url = base_url()

    params =
      if Enum.empty?(params) do
        ""
      else
        "?" <> URI.encode_query(params)
      end

    headers = %{
      "Authorization" => "token #{api_key}",
      "Accept" => "application/vnd.github.v3+json"
    }

    response = HTTPoison.get("#{url}#{endpoint}#{params}", headers)

    case response do
      {:ok, %HTTPoison.Response{status_code: status_code, body: body}}
      when status_code >= 200 and status_code < 300 ->
        {:ok, Jason.decode!(body)}

      {:ok, %HTTPoison.Response{body: body}} ->
        {:error, Jason.decode!(body)}

      {:error, %HTTPoison.Error{reason: reason}} ->
        {:error, %{"message" => "httpoison error: #{reason}"}}
    end
  end

  def repo(owner, repo) do
    get("/repos/#{owner}/#{repo}")
  end

  def repo_issues(owner, repo, params \\ %{}) do
    get("/repos/#{owner}/#{repo}/issues", params)
  end

  def repo_events(owner, repo, params \\ %{}) do
    get("/repos/#{owner}/#{repo}/issues/events", params)
  end
end
