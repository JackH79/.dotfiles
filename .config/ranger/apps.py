import ranger
from ranger.api.apps import *
from ranger.ext.get_executables import get_executables

class CustomApplications(Applications):
	def app_default(self, c):
		"""How to determine the default application?"""
		f = c.file

		# ranger can act as a file chooser when running with --choosefile=...
		if ranger.arg.choosefile:
			open(ranger.arg.choosefile, 'w').write(f.path)
			raise SystemExit()

		if f.basename.lower() == 'makefile':
			return self.either(c, 'make')

		if f.extension is not None:
			if f.extension in ('pdf', ):
				c.flags += 'd'
				return self.either(c, 'zathura', 'apvlv')
			if f.extension in ('xml', ):
				return self.either(c, 'editor')
			if f.extension in ('html', 'htm', 'xhtml'):
				return self.either(c, 'luakit', 'firefox', 'jumanji',
						'opera', 'elinks', 'lynx')
			if f.extension == 'swf':
				return self.either(c, 'luakit', 'firefox', 'jumanji', 'opera')
			if f.extension == 'nes':
				return self.either(c, 'fceux')
			if f.extension in ('swc', 'smc'):
				return self.either(c, 'zsnes')
			if f.extension in ('odt', 'ods', 'odp', 'odf', 'odg',
					'doc', 'xls', 'docx', 'xlsx'):
				return self.either(c, 'libreoffice', 'soffice', 'ooffice')

		if f.mimetype is not None:
			if INTERPRETED_LANGUAGES.match(f.mimetype):
				return self.either(c, 'edit_or_run')

		if f.container:
			return self.either(c, 'aunpack', 'file_roller')

		if f.video or f.audio:
			if f.video:
				c.flags += 'd'
			return self.either(c, 'mplayer', 'smplayer', 'vlc', 'totem')

		if f.image:
			return self.either(c, 'sxiv', 'geeqie', 'feh', 'mirage')
#			return self.either(c, 'feh')
		if f.document or f.filetype.startswith('text') or f.size == 0:
			return self.either(c, 'editor')

		# You can put this at the top of the function and mimeopen will
		# always be used for every file.
		return self.either(c, 'mimeopen')


	# ----------------------------------------- application definitions
	# Note: Trivial application definitions are at the bottom
	def app_pager(self, c):
		return tup('less', '-R', *c)

	def app_editor(self, c):
		try:
			default_editor = os.environ['EDITOR']
		except KeyError:
			pass
		else:
			parts = default_editor.split()
			exe_name = os.path.basename(parts[0])
			if exe_name in get_executables():
				return tuple(parts) + tuple(c)

		return self.either(c, 'vim', 'emacs', 'nano')

	def app_edit_or_run(self, c):
		if c.mode is 1:
			return self.app_self(c)
		return self.app_editor(c)

	@depends_on('mplayer')
	def app_mplayer(self, c):
		if c.mode is 1:
			return tup('mplayer', '-fs', *c)

		elif c.mode is 2:
			args = "mplayer -fs -sid 0 -vfm ffmpeg -lavdopts " \
					"lowres=1:fast:skiploopfilter=all:threads=8".split()
			args.extend(c)
			return tup(*args)

		elif c.mode is 3:
			return tup('mplayer', '-mixer', 'software', *c)

		else:
			return tup('mplayer', *c)

	@depends_on('feh')
	def app_feh(self, c):
		arg = {1: '--bg-scale', 2: '--bg-tile', 3: '--bg-center'}

		c.flags += 'd'

		if c.mode in arg: # mode 1, 2 and 3 will set the image as the background
			return tup('feh', arg[c.mode], c.file.path)
		if c.mode is 11 and len(c.files) is 1: # view all files in the cwd
			images = (f.basename for f in self.fm.env.cwd.files if f.image)
			return tup('feh', '--start-at', c.file.basename, *images)
		return tup('feh', *c)

	@depends_on('aunpack')
	def app_aunpack(self, c):
		if c.mode is 0:
			c.flags += 'p'
			return tup('aunpack', '-l', c.file.path)
		return tup('aunpack', c.file.path)

	@depends_on('file-roller')
	def app_file_roller(self, c):
		c.flags += 'd'
		return tup('file-roller', c.file.path)

	@depends_on('make')
	def app_make(self, c):
		if c.mode is 0:
			return tup("make")
		if c.mode is 1:
			return tup("make", "install")
		if c.mode is 2:
			return tup("make", "clear")

	@depends_on('java')
	def app_java(self, c):
		def strip_extensions(file):
			if '.' in file.basename:
				return file.path[:file.path.index('.')]
			return file.path
		files_without_extensions = map(strip_extensions, c.files)
		return tup("java", files_without_extensions)

	@depends_on('totem')
	def app_totem(self, c):
		if c.mode is 0:
			return tup("totem", *c)
		if c.mode is 1:
			return tup("totem", "--fullscreen", *c)

	@depends_on('sxiv')
	def app_sxiv(self, c):
		c.flags += 'd'
		return tup("sxiv", "*", *c)

	@depends_on('mimeopen')
	def app_mimeopen(self, c):
		if c.mode is 0:
			return tup("mimeopen", *c)
		if c.mode is 1: 
			# Will ask user to select program
			# aka "Open with..."
			return tup("mimeopen", "--ask", *c)

# Often a programs invocation is trivial.  For example:
#    vim test.py readme.txt [...]
# This could be implemented like:
#    @depends_on("vim")
#    def app_vim(self, c):
#        return tup("vim", *c.files)
# Instead of creating such a generic function for each program, just add
# its name here and it will be automatically done for you.
CustomApplications.generic('vim', 'fceux', 'elinks', 'wine',
		'zsnes', 'javac')

# By setting flags='d', this programs will not block ranger's terminal:
CustomApplications.generic('opera', 'firefox', 'apvlv', 'evince',
		'zathura', 'gimp', 'mirage', 'eog', flags='d')

# What filetypes are recognized as scripts for interpreted languages?
# This regular expression is used in app_default()
INTERPRETED_LANGUAGES = re.compile(r'''
	^(text|application)/x-(
		haskell|perl|python|ruby|sh
	)$''', re.VERBOSE)
