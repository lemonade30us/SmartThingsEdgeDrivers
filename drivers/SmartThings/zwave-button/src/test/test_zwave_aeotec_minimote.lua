-- Copyright 2021 SmartThings
--
-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
--
--     http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.

local test = require "integration_test"
local capabilities = require "st.capabilities"
local zw = require "st.zwave"
local zw_test_utils = require "integration_test.zwave_test_utils"
local Basic = (require "st.zwave.CommandClass.Basic")({ version = 1 })
local Battery = (require "st.zwave.CommandClass.Battery")({ version=1 })
local Configuration = (require "st.zwave.CommandClass.Configuration")({ version = 4 })
local t_utils = require "integration_test.utils"

local zwave_multi_4_button_profile = t_utils.get_profile_definition("multi-button-4.yml")

local button_endpoints = {
  {
    command_classes = {
      {value = zw.BASIC},
      {value = zw.SCENE_ACTIVATION},
      {value = zw.BATTERY}
    }
  }
}

local mock_aeotec_minimote = test.mock_device.build_test_zwave_device({
  profile = zwave_multi_4_button_profile,
  zwave_endpoints = button_endpoints,
  zwave_manufacturer_id = 0x0086,
  zwave_product_type = 0x0001,
  zwave_product_id = 0x0003
})

local function  test_init()
  test.mock_device.add_test_device(mock_aeotec_minimote)
end
test.set_test_init_function(test_init)

test.register_message_test(
  "Basic set command generate capability to proper component (button1 pushed)",
  {
    {
      channel = "zwave",
      direction = "receive",
      message = {
        mock_aeotec_minimote.id,
        zw_test_utils.zwave_test_build_receive_command(
          Basic:Set({ value = 10 })
        )
      }
    },
    {
      channel = "capability",
      direction = "send",
      message = mock_aeotec_minimote:generate_test_message("button1", capabilities.button.button.pushed({state_change = true}))
    },
    {
      channel = "capability",
      direction = "send",
      message = mock_aeotec_minimote:generate_test_message("main", capabilities.button.button.pushed({state_change = true}))
    }
  }
)

test.register_message_test(
  "Basic set command generate capability to proper component (button1 held)",
  {
    {
      channel = "zwave",
      direction = "receive",
      message = {
        mock_aeotec_minimote.id,
        zw_test_utils.zwave_test_build_receive_command(
          Basic:Set({ value = 20 })
        )
      }
    },
    {
      channel = "capability",
      direction = "send",
      message = mock_aeotec_minimote:generate_test_message("button1", capabilities.button.button.held({state_change = true}))
    },
    {
      channel = "capability",
      direction = "send",
      message = mock_aeotec_minimote:generate_test_message("main", capabilities.button.button.held({state_change = true}))
    }
  }
)


test.register_message_test(
  "Basic set command generate capability to proper component (button2 pushed)",
  {
    {
      channel = "zwave",
      direction = "receive",
      message = {
        mock_aeotec_minimote.id,
        zw_test_utils.zwave_test_build_receive_command(
          Basic:Set({ value = 40 })
        )
      }
    },
    {
      channel = "capability",
      direction = "send",
      message = mock_aeotec_minimote:generate_test_message("button2", capabilities.button.button.pushed({state_change = true}))
    },
    {
      channel = "capability",
      direction = "send",
      message = mock_aeotec_minimote:generate_test_message("main", capabilities.button.button.pushed({state_change = true}))
    }
  }
)

test.register_message_test(
  "Basic set command generate capability to proper component (button2 held)",
  {
    {
      channel = "zwave",
      direction = "receive",
      message = {
        mock_aeotec_minimote.id,
        zw_test_utils.zwave_test_build_receive_command(
          Basic:Set({ value = 60 })
        )
      }
    },
    {
      channel = "capability",
      direction = "send",
      message = mock_aeotec_minimote:generate_test_message("button2", capabilities.button.button.held({state_change = true}))
    },
    {
      channel = "capability",
      direction = "send",
      message = mock_aeotec_minimote:generate_test_message("main", capabilities.button.button.held({state_change = true}))
    }
  }
)

test.register_message_test(
  "Basic set command generate capability to proper component (button3 pushed)",
  {
    {
      channel = "zwave",
      direction = "receive",
      message = {
        mock_aeotec_minimote.id,
        zw_test_utils.zwave_test_build_receive_command(
          Basic:Set({ value = 80 })
        )
      }
    },
    {
      channel = "capability",
      direction = "send",
      message = mock_aeotec_minimote:generate_test_message("button3", capabilities.button.button.pushed({state_change = true}))
    },
    {
      channel = "capability",
      direction = "send",
      message = mock_aeotec_minimote:generate_test_message("main", capabilities.button.button.pushed({state_change = true}))
    }
  }
)

test.register_message_test(
  "Basic set command generate capability to proper component (button3 held)",
  {
    {
      channel = "zwave",
      direction = "receive",
      message = {
        mock_aeotec_minimote.id,
        zw_test_utils.zwave_test_build_receive_command(
          Basic:Set({ value = 100 })
        )
      }
    },
    {
      channel = "capability",
      direction = "send",
      message = mock_aeotec_minimote:generate_test_message("button3", capabilities.button.button.held({state_change = true}))
    },
    {
      channel = "capability",
      direction = "send",
      message = mock_aeotec_minimote:generate_test_message("main", capabilities.button.button.held({state_change = true}))
    }
  }
)

test.register_message_test(
  "Basic set command generate capability to proper component (button4 pushed)",
  {
    {
      channel = "zwave",
      direction = "receive",
      message = {
        mock_aeotec_minimote.id,
        zw_test_utils.zwave_test_build_receive_command(
          Basic:Set({ value = 120 })
        )
      }
    },
    {
      channel = "capability",
      direction = "send",
      message = mock_aeotec_minimote:generate_test_message("button4", capabilities.button.button.pushed({state_change = true}))
    },
    {
      channel = "capability",
      direction = "send",
      message = mock_aeotec_minimote:generate_test_message("main", capabilities.button.button.pushed({state_change = true}))
    }
  }
)

test.register_message_test(
  "Basic set command generate capability to proper component (button4 held)",
  {
    {
      channel = "zwave",
      direction = "receive",
      message = {
        mock_aeotec_minimote.id,
        zw_test_utils.zwave_test_build_receive_command(
          Basic:Set({ value = 140 })
        )
      }
    },
    {
      channel = "capability",
      direction = "send",
      message = mock_aeotec_minimote:generate_test_message("button4", capabilities.button.button.held({state_change = true}))
    },
    {
      channel = "capability",
      direction = "send",
      message = mock_aeotec_minimote:generate_test_message("main", capabilities.button.button.held({state_change = true}))
    }
  }
)

test.register_coroutine_test(
  "doConfigure lifecycle event should generate proper configuration command for aeotec minimote",
  function()
    test.socket.zwave:__set_channel_ordering("relaxed")
    test.socket.device_lifecycle:__queue_receive({ mock_aeotec_minimote.id, "doConfigure" })
    test.socket.zwave:__expect_send(zw_test_utils.zwave_test_build_send_command(
        mock_aeotec_minimote,
        Battery:Get({})
    ))
    test.socket.zwave:__expect_send(zw_test_utils.zwave_test_build_send_command(
        mock_aeotec_minimote,
        Configuration:Set({parameter_number = 241, size = 1, configuration_value = 1})
    ))
    test.socket.zwave:__expect_send(zw_test_utils.zwave_test_build_send_command(
        mock_aeotec_minimote,
        Configuration:Set({parameter_number = 242, size = 1, configuration_value = 1})
    ))
    test.socket.zwave:__expect_send(zw_test_utils.zwave_test_build_send_command(
        mock_aeotec_minimote,
        Configuration:Set({parameter_number = 243, size = 1, configuration_value = 1})
    ))
    test.socket.zwave:__expect_send(zw_test_utils.zwave_test_build_send_command(
        mock_aeotec_minimote,
        Configuration:Set({parameter_number = 244, size = 1, configuration_value = 1})
    ))
    test.socket.zwave:__expect_send(zw_test_utils.zwave_test_build_send_command(
        mock_aeotec_minimote,
        Configuration:Set({parameter_number = 0, size = 1, configuration_value = 1})
    ))
    test.socket.zwave:__expect_send(zw_test_utils.zwave_test_build_send_command(
        mock_aeotec_minimote,
        Configuration:Set({parameter_number = 40, size = 1, configuration_value = 1})
    ))
    test.socket.zwave:__expect_send(zw_test_utils.zwave_test_build_send_command(
        mock_aeotec_minimote,
        Configuration:Set({parameter_number = 80, size = 1, configuration_value = 1})
    ))
    test.socket.zwave:__expect_send(zw_test_utils.zwave_test_build_send_command(
        mock_aeotec_minimote,
        Configuration:Set({parameter_number = 120, size = 1, configuration_value = 1})
    ))
    test.socket.zwave:__expect_send(zw_test_utils.zwave_test_build_send_command(
        mock_aeotec_minimote,
        Configuration:Set({parameter_number = 20, size = 1, configuration_value = 1})
    ))
    test.socket.zwave:__expect_send(zw_test_utils.zwave_test_build_send_command(
        mock_aeotec_minimote,
        Configuration:Set({parameter_number = 60, size = 1, configuration_value = 1})
    ))
    test.socket.zwave:__expect_send(zw_test_utils.zwave_test_build_send_command(
        mock_aeotec_minimote,
        Configuration:Set({parameter_number = 100, size = 1, configuration_value = 1})
    ))
    test.socket.zwave:__expect_send(zw_test_utils.zwave_test_build_send_command(
        mock_aeotec_minimote,
        Configuration:Set({parameter_number = 140, size = 1, configuration_value = 1})
    ))
    mock_aeotec_minimote:expect_metadata_update({ provisioning_state = "PROVISIONED" })
  end
)

test.register_message_test(
  "Device added event should make proper event for aeotec minimote",
  {
    {
      channel = "device_lifecycle",
      direction = "receive",
      message = { mock_aeotec_minimote.id, "added" },
    },
    {
      channel = "capability",
      direction = "send",
      message = mock_aeotec_minimote:generate_test_message("main", capabilities.button.supportedButtonValues(
        {"pushed", "held"}
      ))
    },
    {
      channel = "capability",
      direction = "send",
      message = mock_aeotec_minimote:generate_test_message("main", capabilities.button.numberOfButtons(
        { value = 4 }
      ))
    }
  },
  {
    inner_block_ordering = "relaxed"
  }
)

test.run_registered_tests()
