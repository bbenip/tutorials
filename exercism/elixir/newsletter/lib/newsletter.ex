defmodule Newsletter do
  def read_emails(path), do: path |> File.read!() |> String.split("\n", trim: true)

  def open_log(path), do: File.open!(path, [:write])

  def log_sent_email(pid, email), do: IO.puts(pid, email)

  def close_log(pid), do: File.close(pid)

  def send_newsletter(emails_path, log_path, send_fun) do
    log_file_pid = open_log(log_path)

    emails = read_emails(emails_path)

    Enum.each(
      emails,
      fn email ->
        send_result = send_fun.(email)

        if send_result === :ok, do: log_sent_email(log_file_pid, email)
      end
    )

    close_log(log_file_pid)
  end
end
