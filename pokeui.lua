--Config UI
local no_restart_toggles_left = { 
                 {ref_value = "jokers_only", label = "Jokers Only?"}, {ref_value = "no_evos", label = "No Evolutions?"}, {ref_value = "pokeballs", label = "Pokeballs?"}
                }
                
local no_restart_toggles_right = { 
  {ref_value = "pokemon_num", label = "Pokedex Numbers?"}, {ref_value = "pokemon_splash", label = "Pokemon Intro?"}, 
}
local restart_toggles = {{ref_value = "pokemon_only", label = "Pokemon Only?"}, {ref_value = "unlimited_energy", label = "Unlimited Energy?"}, 
                         {ref_value = "shiny_playing_card", label = "Shiny Playing Cards?"}, {ref_value = "gen_one", label = "Gen 1 Only?"}}
                       
local create_menu_toggles = function (parent, toggles)
  for k, v in ipairs(toggles) do
    parent.nodes[#parent.nodes + 1] = create_toggle({
          label = v.label,
          ref_table = pokermon_config,
          ref_value = v.ref_value,
          callback = function(_set_toggle)
            NFS.write(mod_dir.."/config.lua", STR_PACK(pokermon_config))
          end,
    })
  end
end

pokemonconfig = function()
  local no_restart_left_settings = {n = G.UIT.C, config = {align = "tl", padding = 0.05, scale = 0.75, colour = G.C.CLEAR,}, nodes = {}}
  create_menu_toggles(no_restart_left_settings, no_restart_toggles_left)

  local no_restart_right_settings = {n = G.UIT.C, config = {align = "tl", padding = 0.05, scale = 0.75, colour = G.C.CLEAR,}, nodes = {}}
  create_menu_toggles(no_restart_right_settings, no_restart_toggles_right)

  local restart_settings = {n = G.UIT.R, config = {align = "tm", padding = 0.05, scale = 0.75, colour = G.C.CLEAR,}, nodes = {}}
  create_menu_toggles(restart_settings, restart_toggles)
  
  local config_nodes =   
  {
    {
      n = G.UIT.R,
      config = {
        padding = 0,
        align = "cm"
      },
      nodes = {
        {
          n = G.UIT.T,
          config = {
            text = "No Restart Required:",
            shadow = true,
            scale = 0.75 * 0.8,
            colour = HEX("ED533A")
          }
        }
      },
    },
    restart_settings,
    {
      n = G.UIT.R,
      config = {
        padding = 0,
        align = "cm"
      },
      nodes = {
        {
          n = G.UIT.T,
          config = {
            text = "Restart Required:",
            shadow = true,
            scale = 0.75 * 0.8,
            colour = HEX("ED533A")
          }
        }
      },
    },
    {
      n = G.UIT.R,
      config = {
        padding = 0,
        align = "tm"
      },
      nodes = {no_restart_left_settings, no_restart_right_settings},
    },
  }
  return config_nodes
end

SMODS.current_mod.config_tab = function()
    return {
      n = G.UIT.ROOT,
      config = {
        align = "cm",
        padding = 0.05,
        colour = G.C.CLEAR,
      },
      nodes = pokemonconfig()
    }
end

SMODS.current_mod.extra_tabs = function()
  local scale = 0.75
  return {
    label = "Credits",
    tab_definition_function = function()
      return {
        n = G.UIT.ROOT,
        config = {
          align = "cm",
          padding = 0.05,
          colour = G.C.CLEAR,
        },
        nodes = {
          {
            n = G.UIT.R,
            config = {
              padding = 0,
              align = "cm"
            },
            nodes = {
              {
                n = G.UIT.T,
                config = {
                  text = "Thanks to",
                  shadow = true,
                  scale = scale * 0.8,
                  colour = G.C.UI.TEXT_LIGHT
                }
              }
            }
          },
          {
            n = G.UIT.R,
            config = {
              padding = 0,
              align = "cm"
            },
            nodes = {
              {
                n = G.UIT.T,
                config = {
                  text = "Lead Developer: ",
                  shadow = true,
                  scale = scale * 0.8,
                  colour = G.C.UI.TEXT_LIGHT
                }
              },
              {
                n = G.UIT.T,
                config = {
                  text = "InertSteak",
                  shadow = true,
                  scale = scale * 0.8,
                  colour = G.C.BLUE
                }
              }
            }
          },
          {
            n = G.UIT.R,
            config = {
              padding = 0,
              align = "cm"
            },
            nodes = {
              {
                n = G.UIT.T,
                config = {
                  text = "Graphics Design: ",
                  shadow = true,
                  scale = scale * 0.8,
                  colour = G.C.UI.TEXT_LIGHT
                }
              },
              {
                n = G.UIT.T,
                config = {
                  text = "GayCoonie, Joey J. Jester, Larantula, The Kuro",
                  shadow = true,
                  scale = scale * 0.8,
                  colour = G.C.BLUE
                }
              }
            },
          },
          {
            n = G.UIT.R,
            config = {
              padding = 0,
              align = "cm"
            },
            nodes = {
              {
                n = G.UIT.T,
                config = {
                  text = "Graphics Design(cont.): ",
                  shadow = true,
                  scale = scale * 0.8,
                  colour = G.C.UI.TEXT_LIGHT
                }
              },
              {
                n = G.UIT.T,
                config = {
                  text = "YamperAF, MyDude",
                  shadow = true,
                  scale = scale * 0.8,
                  colour = G.C.BLUE
                }
              }
            },
          },
          {
            n = G.UIT.R,
            config = {
              padding = 0,
              align = "cm"
            },
            nodes = {
              {
                n = G.UIT.T,
                config = {
                  text = "QA Lead: ",
                  shadow = true,
                  scale = scale * 0.8,
                  colour = G.C.UI.TEXT_LIGHT
                }
              },
              {
                n = G.UIT.T,
                config = {
                  text = "Mus",
                  shadow = true,
                  scale = scale * 0.8,
                  colour = G.C.BLUE
                }
              }
            }
          },
          {
            n = G.UIT.R,
            config = {
              padding = 0,
              align = "cm"
            },
            nodes = {
              {
                n = G.UIT.T,
                config = {
                  text = "Developers: ",
                  shadow = true,
                  scale = scale * 0.8,
                  colour = G.C.UI.TEXT_LIGHT
                }
              },
              {
                n = G.UIT.T,
                config = {
                  text = "SDM0, Jevonnissocoolman, Ishtech, Fem",
                  shadow = true,
                  scale = scale * 0.8,
                  colour = G.C.BLUE
                }
              }
            }
          },
          {
            n = G.UIT.R,
            config = {
              padding = 0,
              align = "cm"
            },
            nodes = {
              {
                n = G.UIT.T,
                config = {
                  text = "Community Managers: ",
                  shadow = true,
                  scale = scale * 0.8,
                  colour = G.C.UI.TEXT_LIGHT
                }
              },
              {
                n = G.UIT.T,
                config = {
                  text = "Astra, Kaethela",
                  shadow = true,
                  scale = scale * 0.8,
                  colour = G.C.BLUE
                }
              }
            }
          },
          {
            n = G.UIT.R,
            config = {
              padding = 0,
              align = "cm"
            },
            nodes = {
              {
                n = G.UIT.T,
                config = {
                  text = "Promotion Producer: ",
                  shadow = true,
                  scale = scale * 0.8,
                  colour = G.C.UI.TEXT_LIGHT
                }
              },
              {
                n = G.UIT.T,
                config = {
                  text = "Marie|Tsunami",
                  shadow = true,
                  scale = scale * 0.8,
                  colour = G.C.BLUE
                }
              }
            }
          },
          {
            n = G.UIT.R,
            config = {
              padding = 0.2,
              align = "cm",
            },
            nodes = {
              UIBox_button({
                minw = 3.85,
                button = "pokermon_github",
                label = {"Github"}
              }),
              UIBox_button({
                minw = 3.85,
                colour = HEX("9656ce"),
                button = "pokermon_discord",
                label = {"Discord"}
              })
            },
          },
        },
      }
    end
  }
end
function G.FUNCS.pokermon_github(e)
	love.system.openURL("https://github.com/InertSteak/Pokermon")
end
function G.FUNCS.pokermon_discord(e)
  love.system.openURL("https://discord.gg/3GZTGppef4")
end

--Reserve Area for Pocket packs (adapted from betmma)
local G_UIDEF_use_and_sell_buttons_ref=G.UIDEF.use_and_sell_buttons
    function G.UIDEF.use_and_sell_buttons(card)
        if (card.area == G.pack_cards and G.pack_cards) and card.ability.consumeable then --Add a use button
            if G.STATE == G.STATES.SMODS_BOOSTER_OPENED and SMODS.OPENED_BOOSTER.label:find("Pocket") then
                return {
                    n=G.UIT.ROOT, config = {padding = -0.1,  colour = G.C.CLEAR}, nodes={
                      {n=G.UIT.R, config={ref_table = card, r = 0.08, padding = 0.1, align = "bm", minw = 0.5*card.T.w - 0.15, minh = 0.7*card.T.h, maxw = 0.7*card.T.w - 0.15, hover = true, shadow = true, colour = G.C.UI.BACKGROUND_INACTIVE, one_press = true, button = 'use_card', func = 'can_use_consumeable'}, nodes={
                        {n=G.UIT.T, config={text = localize('b_use'),colour = G.C.UI.TEXT_LIGHT, scale = 0.55, shadow = true}}
                      }},
                      {n=G.UIT.R, config={ref_table = card, r = 0.08, padding = 0.1, align = "bm", minw = 0.5*card.T.w - 0.15, maxw = 0.9*card.T.w - 0.15, minh = 0.1*card.T.h, hover = true, shadow = true, colour = G.C.UI.BACKGROUND_INACTIVE, one_press = true, button = 'Can Reserve', func = 'can_reserve_card'}, nodes={
                        {n=G.UIT.T, config={text = localize('b_save'),colour = G.C.UI.TEXT_LIGHT, scale = 0.45, shadow = true}}
                      }},
                      {n=G.UIT.R, config = {align = "bm", w=7.7*card.T.w}},
                      {n=G.UIT.R, config = {align = "bm", w=7.7*card.T.w}},
                      {n=G.UIT.R, config = {align = "bm", w=7.7*card.T.w}},
                      {n=G.UIT.R, config = {align = "bm", w=7.7*card.T.w}},
                      -- I can't explain it
                  }}
            end
        end
        return G_UIDEF_use_and_sell_buttons_ref(card)
    end
    G.FUNCS.can_reserve_card = function(e)
        if #G.consumeables.cards < G.consumeables.config.card_limit then 
            e.config.colour = G.ARGS.LOC_COLOURS.pink
            e.config.button = 'reserve_card' 
        else
          e.config.colour = G.C.UI.BACKGROUND_INACTIVE
          e.config.button = nil
        end
    end
    G.FUNCS.reserve_card = function(e) -- only works for consumeables
        local c1 = e.config.ref_table
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.1,
            func = function()
              c1.area:remove_card(c1)
              c1:add_to_deck()
              if c1.children.price then c1.children.price:remove() end
              c1.children.price = nil
              if c1.children.buy_button then c1.children.buy_button:remove() end
              c1.children.buy_button = nil
              remove_nils(c1.children)
              G.consumeables:emplace(c1)
              G.GAME.pack_choices = G.GAME.pack_choices - 1
              if G.GAME.pack_choices <= 0 then
                G.FUNCS.end_consumeable(nil, delay_fac)
              end
              return true
            end
        }))
    end
    G.FUNCS.reserve_card_to_joker_slot = function(e) -- only works for consumeables
        local c1 = e.config.ref_table
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.1,
            func = function()
              c1.area:remove_card(c1)
              c1:add_to_deck()
              if c1.children.price then c1.children.price:remove() end
              c1.children.price = nil
              if c1.children.buy_button then c1.children.buy_button:remove() end
              c1.children.buy_button = nil
              remove_nils(c1.children)
              G.jokers:emplace(c1)
              G.GAME.pack_choices = G.GAME.pack_choices - 1
              if G.GAME.pack_choices <= 0 then
                G.FUNCS.end_consumeable(nil, delay_fac)
              end
              return true
            end
        }))
    end

