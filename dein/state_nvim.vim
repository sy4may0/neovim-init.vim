if g:dein#_cache_version !=# 100 || g:dein#_init_runtimepath !=# '/home/sy4may0/.config/nvim/dein/repos/github.com/Shougo/dein.vim/,/home/sy4may0/.config/nvim,/etc/xdg/xdg-ubuntu/nvim,/etc/xdg/nvim,/home/sy4may0/.local/share/nvim/site,/usr/share/ubuntu/nvim/site,/usr/local/share/nvim/site,/usr/share/nvim/site,/var/lib/snapd/desktop/nvim/site,/usr/share/nvim/runtime,/var/lib/snapd/desktop/nvim/site/after,/usr/share/nvim/site/after,/usr/local/share/nvim/site/after,/usr/share/ubuntu/nvim/site/after,/home/sy4may0/.local/share/nvim/site/after,/etc/xdg/nvim/after,/etc/xdg/xdg-ubuntu/nvim/after,/home/sy4may0/.config/nvim/after' | throw 'Cache loading error' | endif
let [plugins, ftplugin] = dein#load_cache_raw(['/home/sy4may0/.config/nvim/init.vim', '/home/sy4may0/.config/nvim/dein/rc/dein.toml', '/home/sy4may0/.config/nvim/dein/rc/dein_lazy.toml'])
if empty(plugins) | throw 'Cache loading error' | endif
let g:dein#_plugins = plugins
let g:dein#_ftplugin = ftplugin
let g:dein#_base_path = '/home/sy4may0/.config/nvim/dein'
let g:dein#_runtime_path = '/home/sy4may0/.config/nvim/dein/.cache/init.vim/.dein'
let g:dein#_cache_path = '/home/sy4may0/.config/nvim/dein/.cache/init.vim'
let &runtimepath = '/home/sy4may0/.config/nvim/dein/repos/github.com/Shougo/dein.vim/,/home/sy4may0/.config/nvim,/etc/xdg/xdg-ubuntu/nvim,/etc/xdg/nvim,/home/sy4may0/.local/share/nvim/site,/usr/share/ubuntu/nvim/site,/usr/local/share/nvim/site,/usr/share/nvim/site,/var/lib/snapd/desktop/nvim/site,/home/sy4may0/.config/nvim/dein/repos/github.com/Shougo/dein.vim,/home/sy4may0/.config/nvim/dein/.cache/init.vim/.dein,/usr/share/nvim/runtime,/home/sy4may0/.config/nvim/dein/.cache/init.vim/.dein/after,/var/lib/snapd/desktop/nvim/site/after,/usr/share/nvim/site/after,/usr/local/share/nvim/site/after,/usr/share/ubuntu/nvim/site/after,/home/sy4may0/.local/share/nvim/site/after,/etc/xdg/nvim/after,/etc/xdg/xdg-ubuntu/nvim/after,/home/sy4may0/.config/nvim/after'
filetype off
autocmd dein-events InsertEnter * call dein#autoload#_on_event("InsertEnter", ['deoplete.nvim', 'deoplete-jedi'])
