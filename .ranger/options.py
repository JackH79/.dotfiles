from ranger.api.options import *

# Which colorscheme to use?  These colorschemes are available by default:
# default, default88, texas, jungle, snow
# Snow is monochrome, texas and default88 use 88 colors.
colorscheme = 'jungle'

# Preview files on the rightmost column?
# And collapse the last column if there is nothing to preview?
preview_files = True
preview_directories = True
max_filesize_for_preview = 300 * 1024  # 300kb
collapse_preview = True

# How many columns are there, and what are their relative widths?
column_ratios = (1, 1, 4, 2)

# Flush the input after each key hit?  (Noticable when ranger lags)
flushinput = False
