#-- copyright
# OpenProject Costs Plugin
#
# Copyright (C) 2009 - 2014 the OpenProject Foundation (OPF)
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# version 3.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
#++

module OpenProject::Costs::Patches::UsersHelperPatch
  def self.included(base) # :nodoc:
    base.prepend(InstanceMethods)

    base.class_eval do
      alias_method :user_settings_tabs_without_rates, :user_settings_tabs
      alias_method :user_settings_tabs, :user_settings_tabs_with_rates
    end
  end

  module InstanceMethods
    # Adds a rates tab to the user administration page
    def user_settings_tabs_with_rates
      # Core defined data
      user_settings_tabs_without_rates + [{ name: 'rates', partial: 'users/rates', label: :caption_rate_history }]
    end
  end
end
