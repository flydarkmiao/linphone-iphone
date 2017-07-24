/*
 * utils.h
 * Copyright (C) 2017  Belledonne Communications SARL
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

#ifndef _UTILS_H_
#define _UTILS_H_

#include <string>
#include <vector>

// =============================================================================

namespace LinphonePrivate {
	namespace Utils {
		bool iequals (const std::string &a, const std::string &b);

		std::vector<std::string> split (const std::string &str, const std::string &delimiter);

		inline std::vector<std::string> split (const std::string &str, char delimiter) {
			return split(str, std::string(1, delimiter));
		}
	}
}

#endif // ifndef _UTILS_H_
