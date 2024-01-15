defmodule RationalNumbers do
  @type rational :: {integer, integer}

  @doc """
  Add two rational numbers
  """
  @spec add(a :: rational, b :: rational) :: rational
  def add({a_numerator, a_denominator}, {b_numerator, b_denominator}) do
    sum_numerator = a_numerator * b_denominator + a_denominator * b_numerator
    sum_denominator = a_denominator * b_denominator

    reduce({sum_numerator, sum_denominator})
  end

  @doc """
  Subtract two rational numbers
  """
  @spec subtract(a :: rational, b :: rational) :: rational
  def subtract({a_numerator, a_denominator}, {b_numerator, b_denominator}) do
    difference_numerator = a_numerator * b_denominator - a_denominator * b_numerator
    difference_denominator = a_denominator * b_denominator

    reduce({difference_numerator, difference_denominator})
  end

  @doc """
  Multiply two rational numbers
  """
  @spec multiply(a :: rational, b :: rational) :: rational
  def multiply({a_numerator, a_denominator}, {b_numerator, b_denominator}) do
    product_numerator = a_numerator * b_numerator
    product_denominator = a_denominator * b_denominator

    reduce({product_numerator, product_denominator})
  end

  @doc """
  Divide two rational numbers
  """
  @spec divide_by(num :: rational, den :: rational) :: rational
  def divide_by({num_numerator, num_denominator}, {den_numerator, den_denominator}) do
    quotient_numerator = num_numerator * den_denominator
    quotient_denominator = num_denominator * den_numerator

    reduce({quotient_numerator, quotient_denominator})
  end

  @doc """
  Absolute value of a rational number
  """
  @spec abs(a :: rational) :: rational
  def abs({numerator, denominator}) do
    reduce({Kernel.abs(numerator), Kernel.abs(denominator)})
  end

  @doc """
  Exponentiation of a rational number by an integer
  """
  @spec pow_rational(a :: rational, n :: integer) :: rational
  def pow_rational({numerator, denominator}, n) when n < 0 do
    reduce({denominator ** -n, numerator ** -n})
  end

  def pow_rational({numerator, denominator}, n) do
    reduce({numerator ** n, denominator ** n})
  end

  @doc """
  Exponentiation of a real number by a rational number
  """
  @spec pow_real(x :: integer, n :: rational) :: float
  def pow_real(x, {numerator, denominator}) do
    x ** (numerator / denominator)
  end

  @doc """
  Reduce a rational number to its lowest terms
  """
  @spec reduce(a :: rational) :: rational
  def reduce({numerator, denominator}) when denominator < 0 do
    reduce({-numerator, -denominator})
  end

  def reduce({numerator, denominator}) do
    divisor = Integer.gcd(numerator, denominator)

    reduced_numerator = div(numerator, divisor)
    reduced_denominator = div(denominator, divisor)

    {reduced_numerator, reduced_denominator}
  end
end
