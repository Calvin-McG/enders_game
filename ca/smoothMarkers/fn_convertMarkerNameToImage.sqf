#include "macros.hpp"

params ["_iconName"];

switch (_iconName) do
{
    case "b_inf": {INFANTRY};
    case "b_air": {HELO};
  default {INFANTRY};
}
