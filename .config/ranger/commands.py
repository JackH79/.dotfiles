from ranger.api.commands import *
from ranger.ext.get_executables import get_executables
from ranger.core.runner import ALLOWED_FLAGS
class DD(Command):

	allow_abbrev = False

	def execute(self):
		line = parse(self.line)
		lastword = line.chunk(-1)

		if lastword.startswith('y'):
			# user confirmed deletion!
			return self.fm.delete()
		elif self.line.startswith(DELETE_WARNING):
			# user did not confirm deletion
			return

		cwd = self.fm.env.cwd
		cf = self.fm.env.cf

		if cwd.marked_items or (cf.is_directory and not cf.is_link \
				and len(os.listdir(cf.path)) > 0):
			# better ask for a confirmation, when attempting to
			# delete multiple files or a non-empty directory.
			return self.fm.open_console(DELETE_WARNING)

		# no need for a confirmation, just delete
		self.fm.delete()
