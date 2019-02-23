--[[
    WireBait for wirebait is a lua package to help write Wireshark
    Dissectors in lua
    [Wirebait on Github](https://github.com/MarkoPaul0/WireBait)
    Copyright (C) 2015-2017 Markus Leballeux

    This program is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation; either version 2 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License along
    with this program; if not, write to the Free Software Foundation, Inc.,
    51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
]]

local ColumnClass = {};

function ColumnClass.new(txt)
    local column = {
        _struct_type = "Column";
        m_text = txt or "";
        m_fence = false;
    };

    ------------------------------------------------ metamethods -------------------------------------------------------

    function column:__tostring()
        return self.m_text;
    end

    function column.__concat(op1, op2)
        return tostring(op1) .. tostring(op2);
    end

    ----------------------------------------------- public methods -----------------------------------------------------

    function column:set(text)
        if not self.m_fence then
            self.m_text = text;
        end
    end

    function column:clear()
        if not self.m_fence then
            self.m_text = "";
        end
    end

    function column:append(text)
        self.m_text = self.m_text .. text;
    end

    function column:prepend(text)
        if not self.m_fence then
            self.m_text = text .. self.m_text;
        end
    end

    function column:fence()
        self.m_fence = true;
    end

    function column:clear_fence()
        self.m_fence = false;
    end

    setmetatable(column, column);
    return column;
end

return ColumnClass;