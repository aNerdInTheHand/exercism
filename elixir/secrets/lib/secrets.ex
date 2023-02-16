import Bitwise
defmodule Secrets do
  def secret_add(secret) do
    &(&1 + secret)
  end
  def secret_subtract(secret) do
    &(&1 - secret)
  end
  def secret_multiply(secret) do
    &(&1 * secret)
  end
  def secret_divide(secret) do
    divider = fn numerator -> floor(numerator / secret) end
  end
  def secret_and(secret) do
    &(&1 &&& secret)
  end
  def secret_xor(secret) do
    &(&1 ^^^ secret)
  end
  def secret_combine(secret_function1, secret_function2) do
    combiner = fn val -> secret_function1.(val) |> secret_function2.() end
  end
end
