" Vim syntax file
" Language:		Taskjuggler
" Maintainer:	Peter Poeml <poeml@suse.de>
" Last Change:	$Id: tjp.vim 1335 2006-09-24 13:49:05Z cs $

setlocal softtabstop=2
setlocal cindent shiftwidth=2
setlocal tabstop=2
setlocal cinoptions=g0,t0,+0,(0,c0,C1
setlocal cinwords=task,resource,account,shift,htmltaskreport,htmlresourcereport,htmlaccountreport
setlocal cinkeys=0{,0},!^F,o,O
setlocal cindent

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn case ignore

if version >= 600 
  sy  region  taskfold  start="{"  end="}" transparent fold contains=ALL
  sy  region  macrofold start="\[" end="\]" transparent fold contains=ALL
  syn sync fromstart
  set foldmethod=syntax
endif


" define the tjp syntax
syn match	tjpinclude		"include.*$"
syn keyword tjpstruct	 	resource task macro account shift
" we could also highlight the tags... but it's against the rules
"syn match 	tjpstruct	 	"task\s*\S*"
"syn match 	tjpstruct	 	"macro\s*\S*"
syn keyword tjpspecial		project
syn match	tjpdelimiter 	contained "[();,~]"
syn match	tjpjump 		contained "!"
syn match	tjpbrace		"{}"
syn match	tjparg			contained "\${.*}"
syn match	tjpoperator	contained "[=|&\*\+\<\>]"
syn match	tjpcomment		"#.*"
" TODO: Implement support for C-style comments

syn keyword tjpkeyword account
syn keyword tjpkeyword accountid
syn keyword tjpkeyword accountreport
syn keyword tjpkeyword accounts
syn keyword tjpkeyword accumulate
syn keyword tjpkeyword alap
syn keyword tjpkeyword all
syn keyword tjpkeyword allocate
syn keyword tjpkeyword allocations
syn keyword tjpkeyword allowredefinitions
syn keyword tjpkeyword alternative
syn keyword tjpkeyword asap
syn keyword tjpkeyword barlabels
syn keyword tjpkeyword baseline
syn keyword tjpkeyword booking
syn keyword tjpkeyword bookings
syn keyword tjpkeyword caption
syn keyword tjpkeyword celltext
syn keyword tjpkeyword cellurl
syn keyword tjpkeyword chart
syn keyword tjpkeyword columns
syn keyword tjpkeyword complete
syn keyword tjpkeyword completed
syn keyword tjpkeyword completeddown
syn keyword tjpkeyword completedeffort
syn keyword tjpkeyword completedup
syn keyword tjpkeyword containsTask
syn keyword tjpkeyword copyright
syn keyword tjpkeyword cost
syn keyword tjpkeyword credit
syn keyword tjpkeyword criticalness
syn keyword tjpkeyword criticalnessdown
syn keyword tjpkeyword criticalnessup
syn keyword tjpkeyword csvaccountreport
syn keyword tjpkeyword csvresourcereport
syn keyword tjpkeyword csvtaskreport
syn keyword tjpkeyword currency
syn keyword tjpkeyword currencydigits
syn keyword tjpkeyword currencyformat
syn keyword tjpkeyword customer
syn keyword tjpkeyword d
syn keyword tjpkeyword daily
syn keyword tjpkeyword dailymax
syn keyword tjpkeyword dailyworkinghours
syn keyword tjpkeyword date
syn keyword tjpkeyword day
syn keyword tjpkeyword days
syn keyword tjpkeyword depends
syn keyword tjpkeyword disabled
syn keyword tjpkeyword drawemptycontainersastasks
syn keyword tjpkeyword duration
syn keyword tjpkeyword efficiency
syn keyword tjpkeyword effort
syn keyword tjpkeyword empty
syn keyword tjpkeyword enabled
syn keyword tjpkeyword end
syn keyword tjpkeyword endbuffer
syn keyword tjpkeyword endbufferstart
syn keyword tjpkeyword endcredit
syn keyword tjpkeyword enddown
syn keyword tjpkeyword endsAfter
syn keyword tjpkeyword endsBefore
syn keyword tjpkeyword endup
syn keyword tjpkeyword export
syn keyword tjpkeyword extend
syn keyword tjpkeyword finished
syn keyword tjpkeyword flags
syn keyword tjpkeyword follows
syn keyword tjpkeyword freeload
syn keyword tjpkeyword fri
syn keyword tjpkeyword fullnamedown
syn keyword tjpkeyword fullnameup
syn keyword tjpkeyword gapduration
syn keyword tjpkeyword gaplength
syn keyword tjpkeyword h
syn keyword tjpkeyword hasAssignments
syn keyword tjpkeyword headline
syn keyword tjpkeyword hideaccount
syn keyword tjpkeyword hidecelltext
syn keyword tjpkeyword hidecellurl
syn keyword tjpkeyword hidelinks
syn keyword tjpkeyword hideresource
syn keyword tjpkeyword hidetask
syn keyword tjpkeyword hierarchindex
syn keyword tjpkeyword hierarchlevel
syn keyword tjpkeyword hierarchno
syn keyword tjpkeyword hours
syn keyword tjpkeyword htmlaccountreport
syn keyword tjpkeyword htmlindexreport
syn keyword tjpkeyword htmlmonthlycalendar
syn keyword tjpkeyword htmlresourcereport
syn keyword tjpkeyword htmlstatusreport
syn keyword tjpkeyword htmltaskreport
syn keyword tjpkeyword htmlweeklycalendar
syn keyword tjpkeyword icalreport
syn keyword tjpkeyword id
syn keyword tjpkeyword iddown
syn keyword tjpkeyword idup
syn keyword tjpkeyword include
syn keyword tjpkeyword index
syn keyword tjpkeyword indexdown
syn keyword tjpkeyword indexup
syn keyword tjpkeyword inherit
syn keyword tjpkeyword inprogress
syn keyword tjpkeyword inprogressearly
syn keyword tjpkeyword inprogresslate
syn keyword tjpkeyword isAccount
syn keyword tjpkeyword isActualAllocated
syn keyword tjpkeyword isAllocated
syn keyword tjpkeyword isAllocatedToProject
syn keyword tjpkeyword isAnAccount
syn keyword tjpkeyword isAResource
syn keyword tjpkeyword isATask
syn keyword tjpkeyword isChildOf
syn keyword tjpkeyword isDependencyOf
syn keyword tjpkeyword isDutyOf
syn keyword tjpkeyword isLeaf
syn keyword tjpkeyword isMilestone
syn keyword tjpkeyword isOnCriticalPath
syn keyword tjpkeyword isParentOf
syn keyword tjpkeyword isPlanAllocated
syn keyword tjpkeyword isResource
syn keyword tjpkeyword isSubtaskOf
syn keyword tjpkeyword isTask
syn keyword tjpkeyword isTaskOfProject
syn keyword tjpkeyword isTaskStatus
syn keyword tjpkeyword journalentry
syn keyword tjpkeyword label
syn keyword tjpkeyword late
syn keyword tjpkeyword length
syn keyword tjpkeyword limits
syn keyword tjpkeyword load
syn keyword tjpkeyword loadunit
syn keyword tjpkeyword longauto
syn keyword tjpkeyword m
syn keyword tjpkeyword macro
syn keyword tjpkeyword mandatory
syn keyword tjpkeyword maxeffort
syn keyword tjpkeyword maxeffortdown
syn keyword tjpkeyword maxeffortup
syn keyword tjpkeyword maxend
syn keyword tjpkeyword maxloaded
syn keyword tjpkeyword maxpaths
syn keyword tjpkeyword maxstart
syn keyword tjpkeyword milestone
syn keyword tjpkeyword min
syn keyword tjpkeyword minallocated
syn keyword tjpkeyword mineffort
syn keyword tjpkeyword mineffortdown
syn keyword tjpkeyword mineffortup
syn keyword tjpkeyword minend
syn keyword tjpkeyword minloaded
syn keyword tjpkeyword minslackrate
syn keyword tjpkeyword minstart
syn keyword tjpkeyword minutes
syn keyword tjpkeyword mon
syn keyword tjpkeyword month
syn keyword tjpkeyword monthly
syn keyword tjpkeyword monthlymax
syn keyword tjpkeyword months
syn keyword tjpkeyword name
syn keyword tjpkeyword namedown
syn keyword tjpkeyword nameup
syn keyword tjpkeyword no
syn keyword tjpkeyword note
syn keyword tjpkeyword notimestamp
syn keyword tjpkeyword notstarted
syn keyword tjpkeyword now
syn keyword tjpkeyword numberformat
syn keyword tjpkeyword off
syn keyword tjpkeyword ontime
syn keyword tjpkeyword order
syn keyword tjpkeyword overtime
syn keyword tjpkeyword pathcriticalness
syn keyword tjpkeyword pathcriticalnessdown
syn keyword tjpkeyword pathcriticalnessup
syn keyword tjpkeyword period
syn keyword tjpkeyword persistent
syn keyword tjpkeyword precedes
syn keyword tjpkeyword priority
syn keyword tjpkeyword prioritydown
syn keyword tjpkeyword priorityup
syn keyword tjpkeyword profit
syn keyword tjpkeyword project
syn keyword tjpkeyword projectid
syn keyword tjpkeyword projectids
syn keyword tjpkeyword projection
syn keyword tjpkeyword projectmax
syn keyword tjpkeyword properties
syn keyword tjpkeyword purge
syn keyword tjpkeyword quarter
syn keyword tjpkeyword quarterly
syn keyword tjpkeyword random
syn keyword tjpkeyword rate
syn keyword tjpkeyword ratedown
syn keyword tjpkeyword rateup
syn keyword tjpkeyword rawhead
syn keyword tjpkeyword rawstylesheet
syn keyword tjpkeyword rawtail
syn keyword tjpkeyword reference
syn keyword tjpkeyword remainingeffort
syn keyword tjpkeyword resource
syn keyword tjpkeyword resourceattributes
syn keyword tjpkeyword resourceid
syn keyword tjpkeyword resourcereport
syn keyword tjpkeyword resources
syn keyword tjpkeyword responsibilities
syn keyword tjpkeyword responsible
syn keyword tjpkeyword responsibledown
syn keyword tjpkeyword responsibleup
syn keyword tjpkeyword revenue
syn keyword tjpkeyword rollupaccount
syn keyword tjpkeyword rollupresource
syn keyword tjpkeyword rolluptask
syn keyword tjpkeyword sat
syn keyword tjpkeyword scenario
syn keyword tjpkeyword scenarios
syn keyword tjpkeyword schedule
syn keyword tjpkeyword scheduled
syn keyword tjpkeyword scheduling
syn keyword tjpkeyword select
syn keyword tjpkeyword separator
syn keyword tjpkeyword seqno
syn keyword tjpkeyword sequencedown
syn keyword tjpkeyword sequenceup
syn keyword tjpkeyword shift
syn keyword tjpkeyword shifts
syn keyword tjpkeyword shortauto
syn keyword tjpkeyword shorttimeformat
syn keyword tjpkeyword showprojectids
syn keyword tjpkeyword sloppy
syn keyword tjpkeyword sortaccounts
syn keyword tjpkeyword sortresources
syn keyword tjpkeyword sorttasks
syn keyword tjpkeyword start
syn keyword tjpkeyword startbuffer
syn keyword tjpkeyword startbufferend
syn keyword tjpkeyword startcredit
syn keyword tjpkeyword startdown
syn keyword tjpkeyword startsAfter
syn keyword tjpkeyword startsBefore
syn keyword tjpkeyword startup
syn keyword tjpkeyword status
syn keyword tjpkeyword statusdown
syn keyword tjpkeyword statusnote
syn keyword tjpkeyword statusup
syn keyword tjpkeyword strict
syn keyword tjpkeyword subtitle
syn keyword tjpkeyword subtitleurl
syn keyword tjpkeyword sun
syn keyword tjpkeyword supplement
syn keyword tjpkeyword svggantttaskreport
syn keyword tjpkeyword svgtimetimereport
syn keyword tjpkeyword table
syn keyword tjpkeyword task
syn keyword tjpkeyword taskattributes
syn keyword tjpkeyword taskbarpostfix
syn keyword tjpkeyword taskbarprefix
syn keyword tjpkeyword taskid
syn keyword tjpkeyword taskprefix
syn keyword tjpkeyword taskreport
syn keyword tjpkeyword taskroot
syn keyword tjpkeyword tasks
syn keyword tjpkeyword text
syn keyword tjpkeyword thu
syn keyword tjpkeyword timeformat
syn keyword tjpkeyword timezone
syn keyword tjpkeyword timingresolution
syn keyword tjpkeyword title
syn keyword tjpkeyword titleurl
syn keyword tjpkeyword total
syn keyword tjpkeyword tree
syn keyword tjpkeyword treeLevel
syn keyword tjpkeyword tue
syn keyword tjpkeyword undefined
syn keyword tjpkeyword url
syn keyword tjpkeyword utilization
syn keyword tjpkeyword vacation
syn keyword tjpkeyword version
syn keyword tjpkeyword w
syn keyword tjpkeyword wed
syn keyword tjpkeyword week
syn keyword tjpkeyword weekdays
syn keyword tjpkeyword weekly
syn keyword tjpkeyword weeklymax
syn keyword tjpkeyword weeks
syn keyword tjpkeyword weekstartsmonday
syn keyword tjpkeyword weekstartssunday
syn keyword tjpkeyword workinghours
syn keyword tjpkeyword xmlreport
syn keyword tjpkeyword y
syn keyword tjpkeyword year
syn keyword tjpkeyword yearly
syn keyword tjpkeyword yearlymax
syn keyword tjpkeyword yearlyworkingdays
syn keyword tjpkeyword years
syn region  tjpstring	start=+"+ skip=+\\"+ end=+"+ contains=tjparch 
syn region  tjpstring	start=+`+ skip=+\\'+ end=+'+ contains=tjparch 
syn region  tjpstring	start=+`+ skip=+\\'+ end=+`+ contains=tjparch 

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_tjp_syntax_inits")
  if version < 508
    let did_tjp_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink tjpdelimiter 	Delimiter
  "HiLink tjpoperator	Operator
  HiLink tjpoperator	Delimiter
  HiLink tjpcomment	Comment
  HiLink tjparch		Function
  "HiLink tjpnumber	Number
  "HiLink tjptimes		Constant
  HiLink tjpkeyword	Keyword
  HiLink tjpspecial	Special
  HiLink tjparg		Special
  HiLink tjpstring		String
  HiLink tjpinclude	Include
  HiLink tjpstruct		Structure
  HiLink tjpmilestone 	Error

  "HiLink tjpbrace		Operator
  "HiLink taskfold		Operator

  HiLink tjpjump		Include

  delcommand HiLink
endif

let b:current_syntax = "tjp"

" vim: ts=4


