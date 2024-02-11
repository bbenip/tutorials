defmodule RemoteControlCar do
  @enforce_keys [:nickname]
  defstruct [
    :nickname,
    battery_percentage: 100,
    distance_driven_in_meters: 0,
  ]

  def new(nickname \\ "none"), do: %RemoteControlCar{nickname: nickname}

  def display_distance(%RemoteControlCar{distance_driven_in_meters: distance_driven}) do
    if distance_driven === 1 do
      "1 meter"
    else
      "#{distance_driven} meters"
    end
  end

  def display_battery(%RemoteControlCar{battery_percentage: battery_percentage}) do
    if battery_percentage === 0 do
      "Battery empty"
    else
      "Battery at #{battery_percentage}%"
    end
  end

  def drive(%RemoteControlCar{} = remote_car) do
    battery_percentage = remote_car.battery_percentage
    distance_driven = remote_car.distance_driven_in_meters

    if battery_percentage <= 0 do
      remote_car
    else
      %{
        remote_car |
        battery_percentage: battery_percentage - 1,
        distance_driven_in_meters: distance_driven + 20
      }
    end
  end
end
