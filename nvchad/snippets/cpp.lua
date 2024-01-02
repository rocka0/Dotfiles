local ls = require('luasnip')
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
    s({
        trig = 'CPP',
        dscr = 'Competitive programming template',
    }, {
        t({
            '#include <bits/stdc++.h>',
            'using namespace std;',
            '',
            '#ifdef LOCAL',
            '#include "tl.hpp"',
            '#else',
            '#define dbg(...) 14122021',
            '#endif',
            '',
            'template <typename T>',
            'bool chmax(T &x, T y) {',
            '\treturn x < y && (x = y, true);',
            '}',
            '',
            'template <typename T>',
            'bool chmin(T &x, T y) {',
            '\treturn x > y && (x = y, true);',
            '}',
            '',
            '#define int long long',
            '',
            'signed main() {',
            '\tcin.tie(nullptr)->sync_with_stdio(false);',
            '',
            '\t',
        }),
        i(0, '// The Legend Himself'),
        t({
            '',
            '}',
        }),
    }),
}
