REPO = repo
TAGS = $(REPO)/.git/refs/tags

MAIN_VERSIONS = \
    1.0 1.1 2.1 2.2 2.4 2.5 3.0 3.1 3.2 3.2.1 3.2.2 4.0 4.0.1 5.0 5.0.1 \
    5.0.2 5.0.3 5.1 5.1.1 5.1.2 5.1.3 5.1.4 5.1.5 5.2.0 5.2.1 5.2.2 5.2.3 \
    5.2.4 5.3.0

WORK_VERSIONS = \
    5.1-work0 5.1-work1 5.1-work2 5.1-work3 5.1-work4 5.1-work5 \
    5.1-work6 5.1-alpha 5.1-beta 5.1-rc1 5.1-rc2 5.1-rc3 5.1-rc4 \
    5.1.1-rc1 5.1.1-rc2 5.1.1-rc3 5.1.1-rc4 5.1.2-rc1 5.1.2-rc2 5.1.2-rc3 \
    5.1.2-rc4 5.1.2-rc5 5.1.3-rc1 5.1.3-rc2 5.1.3-rc3 5.1.3-rc4 5.1.3-rc5 \
    5.1.4-rc1 5.1.4-rc2 5.1.4-rc3 5.1.5-rc1 5.1.5-rc2 5.2.0-work1 \
    5.2.0-work2 5.2.0-work3 5.2.0-work4 5.2.0-work5 5.2.0-alpha-rc1 \
    5.2.0-alpha-rc2 5.2.0-alpha-rc3 5.2.0-alpha-rc4 5.2.0-alpha \
    5.2.0-beta-rc1 5.2.0-beta-rc2 5.2.0-beta-rc3 5.2.0-beta-rc4 \
    5.2.0-beta-rc5 5.2.0-beta-rc6 5.2.0-beta-rc7 5.2.0-beta 5.2.0-rc1 \
    5.2.0-rc2 5.2.0-rc3 5.2.0-rc4 5.2.0-rc5 5.2.0-rc6 5.2.0-rc7 5.2.0-rc8 \
    5.2.1-work1 5.2.1-rc1 5.2.1-rc2 5.2.1-rc3 5.2.1-rc4 5.2.2-rc1 5.2.2-rc2 \
    5.2.2-rc3 5.2.2-rc4 5.2.3-rc1 5.2.4-rc1 5.3.0-work1 5.3.0-work2 \
    5.3.0-work3 5.3.0-alpha 5.3.0-beta 5.3.0-rc0 5.3.0-rc1 5.3.0-rc2 \
    5.3.0-rc3 5.3.0-rc4

$(TAGS)/5.3.0: $(TAGS)/5.3.0-rc3
$(TAGS)/5.3.0: private EXTRA_TAG = 5.3.0-rc4
$(TAGS)/5.3.0-rc3: $(TAGS)/5.3.0-rc2
$(TAGS)/5.3.0-rc2: $(TAGS)/5.3.0-rc1
$(TAGS)/5.3.0-rc1: $(TAGS)/5.3.0-rc0
$(TAGS)/5.3.0-rc0: $(TAGS)/5.3.0-beta
$(TAGS)/5.3.0-beta: $(TAGS)/5.3.0-alpha
$(TAGS)/5.3.0-alpha: $(TAGS)/5.3.0-work3
$(TAGS)/5.3.0-work3: $(TAGS)/5.3.0-work2
$(TAGS)/5.3.0-work2: $(TAGS)/5.3.0-work1
$(TAGS)/5.3.0-work1: $(TAGS)/5.2.2
# TODO: 5.2.3-rc1 --> 5.2.4 (branched at 5.2.2)
$(TAGS)/5.2.2: $(TAGS)/5.2.2-rc3
$(TAGS)/5.2.2: private EXTRA_TAG = 5.2.2-rc4
$(TAGS)/5.2.2-rc3: $(TAGS)/5.2.2-rc2
$(TAGS)/5.2.2-rc2: $(TAGS)/5.2.2-rc1
$(TAGS)/5.2.2-rc1: $(TAGS)/5.2.1
$(TAGS)/5.2.1: $(TAGS)/5.2.1-rc3
$(TAGS)/5.2.1: private EXTRA_TAG = 5.2.1-rc4
$(TAGS)/5.2.1-rc3: $(TAGS)/5.2.1-rc2
$(TAGS)/5.2.1-rc2: $(TAGS)/5.2.1-rc1
$(TAGS)/5.2.1-rc1: $(TAGS)/5.2.1-work1
$(TAGS)/5.2.1-work1: $(TAGS)/5.2.0
$(TAGS)/5.2.0: $(TAGS)/5.2.0-rc7
$(TAGS)/5.2.0: private EXTRA_TAG = 5.2.0-rc8
$(TAGS)/5.2.0-rc7: $(TAGS)/5.2.0-rc6
$(TAGS)/5.2.0-rc6: $(TAGS)/5.2.0-rc5
$(TAGS)/5.2.0-rc5: $(TAGS)/5.2.0-rc4
$(TAGS)/5.2.0-rc4: $(TAGS)/5.2.0-rc3
$(TAGS)/5.2.0-rc3: $(TAGS)/5.2.0-rc2
$(TAGS)/5.2.0-rc2: $(TAGS)/5.2.0-rc1
$(TAGS)/5.2.0-rc1: $(TAGS)/5.2.0-beta
$(TAGS)/5.2.0-beta: $(TAGS)/5.2.0-beta-rc6
$(TAGS)/5.2.0-beta: private EXTRA_TAG = 5.2.0-beta-rc7
$(TAGS)/5.2.0-beta-rc6: $(TAGS)/5.2.0-beta-rc5
$(TAGS)/5.2.0-beta-rc5: $(TAGS)/5.2.0-beta-rc4
$(TAGS)/5.2.0-beta-rc4: $(TAGS)/5.2.0-beta-rc3
$(TAGS)/5.2.0-beta-rc3: $(TAGS)/5.2.0-beta-rc2
$(TAGS)/5.2.0-beta-rc2: $(TAGS)/5.2.0-beta-rc1
$(TAGS)/5.2.0-beta-rc1: $(TAGS)/5.2.0-alpha
$(TAGS)/5.2.0-alpha: $(TAGS)/5.2.0-alpha-rc3
$(TAGS)/5.2.0-alpha: private EXTRA_TAG = 5.2.0-alpha-rc4
$(TAGS)/5.2.0-alpha-rc3: $(TAGS)/5.2.0-alpha-rc2
$(TAGS)/5.2.0-alpha-rc2: $(TAGS)/5.2.0-alpha-rc1
$(TAGS)/5.2.0-alpha-rc1: $(TAGS)/5.2.0-work5
$(TAGS)/5.2.0-work5: $(TAGS)/5.2.0-work4
$(TAGS)/5.2.0-work4: $(TAGS)/5.2.0-work3
$(TAGS)/5.2.0-work3: $(TAGS)/5.2.0-work2
$(TAGS)/5.2.0-work2: $(TAGS)/5.2.0-work1
$(TAGS)/5.2.0-work1: $(TAGS)/5.1.4
# TODO: 5.1.5-rc1 --> 5.1.5 (branched at 5.1.4)
$(TAGS)/5.1.4: $(TAGS)/5.1.4-rc2
$(TAGS)/5.1.4: private EXTRA_TAG = 5.1.4-rc3
$(TAGS)/5.1.4-rc2: $(TAGS)/5.1.4-rc1
$(TAGS)/5.1.4-rc1: $(TAGS)/5.1.3
$(TAGS)/5.1.3: $(TAGS)/5.1.3-rc4
$(TAGS)/5.1.3: private EXTRA_TAG = 5.1.3-rc5
$(TAGS)/5.1.3-rc4: $(TAGS)/5.1.3-rc3
$(TAGS)/5.1.3-rc3: $(TAGS)/5.1.3-rc2
$(TAGS)/5.1.3-rc2: $(TAGS)/5.1.3-rc1
$(TAGS)/5.1.3-rc1: $(TAGS)/5.1.2
$(TAGS)/5.1.2: $(TAGS)/5.1.2-rc4
$(TAGS)/5.1.2: private EXTRA_TAG = 5.1.2-rc5
$(TAGS)/5.1.2-rc4: $(TAGS)/5.1.2-rc3
$(TAGS)/5.1.2-rc3: $(TAGS)/5.1.2-rc2
$(TAGS)/5.1.2-rc2: $(TAGS)/5.1.2-rc1
$(TAGS)/5.1.2-rc1: $(TAGS)/5.1.1
$(TAGS)/5.1.1: $(TAGS)/5.1.1-rc3
$(TAGS)/5.1.1: private EXTRA_TAG = 5.1.1-rc4
$(TAGS)/5.1.1-rc3: $(TAGS)/5.1.1-rc2
$(TAGS)/5.1.1-rc2: $(TAGS)/5.1.1-rc1
$(TAGS)/5.1.1-rc1: $(TAGS)/5.1
$(TAGS)/5.1: $(TAGS)/5.1-rc4
$(TAGS)/5.1-rc4: $(TAGS)/5.1-rc3
$(TAGS)/5.1-rc3: $(TAGS)/5.1-rc2
$(TAGS)/5.1-rc2: $(TAGS)/5.1-rc1
$(TAGS)/5.1-rc1: $(TAGS)/5.1-beta
$(TAGS)/5.1-beta: $(TAGS)/5.1-alpha
$(TAGS)/5.1-alpha: $(TAGS)/5.1-work6
$(TAGS)/5.1-work6: $(TAGS)/5.1-work5
$(TAGS)/5.1-work5: $(TAGS)/5.1-work4
$(TAGS)/5.1-work4: $(TAGS)/5.1-work3
$(TAGS)/5.1-work3: $(TAGS)/5.1-work2
$(TAGS)/5.1-work2: $(TAGS)/5.1-work1
$(TAGS)/5.1-work1: $(TAGS)/5.1-work0
$(TAGS)/5.1-work0: $(TAGS)/5.0.2
# TODO: 5.0.3 (branched at 5.0.2)
$(TAGS)/5.0.2: $(TAGS)/5.0.1
$(TAGS)/5.0.1: $(TAGS)/5.0
$(TAGS)/5.0: $(TAGS)/4.0.1
$(TAGS)/4.0.1: $(TAGS)/4.0
$(TAGS)/4.0: $(TAGS)/3.2.2
$(TAGS)/3.2.2: $(TAGS)/3.2.1
$(TAGS)/3.2.1: $(TAGS)/3.2
$(TAGS)/3.2: $(TAGS)/3.1
$(TAGS)/3.1: $(TAGS)/3.0
$(TAGS)/3.0: $(TAGS)/2.5
$(TAGS)/2.5: $(TAGS)/2.4
$(TAGS)/2.4: $(TAGS)/2.2
$(TAGS)/2.2: $(TAGS)/2.1
$(TAGS)/2.1: $(TAGS)/1.1
$(TAGS)/1.1: $(TAGS)/1.0
$(TAGS)/1.0: | $(REPO)/

lua-5.3.0-rc%/: private TARDIR = lua-5.3.0
lua-5.2.2-rc%/: private TARDIR = lua-5.2.2
lua-5.2.1-rc%/: private TARDIR = lua-5.2.1
lua-5.2.0-rc%/: private TARDIR = lua-5.2.0
lua-5.2.0-beta-rc%/: private TARDIR = lua-5.2.0-beta
lua-5.2.0-alpha-rc%/: private TARDIR = lua-5.2.0-alpha
lua-5.1.4-rc%/: private TARDIR = lua-5.1.4
lua-5.1.3-rc%/: private TARDIR = lua-5.1.3
lua-5.1.2-rc%/: private TARDIR = lua-5.1.2
lua-5.1.1-rc%/: private TARDIR = lua-5.1.1
lua-5.1-rc%/: private TARDIR = lua-5.1
lua-4.0/: private TARDIR = lua
lua-3.0/ lua-3.1/ lua-3.2/ lua-3.2.1/ lua-3.2.2/: private TARDIR = lua
lua-2.1/ lua-2.2/ lua-2.4/ lua-2.5/: private TARDIR = lua
lua-1.1/: private TARDIR = lua

$(TAGS)/5.3.0: private AUTHOR_DATE = 2015-01-06T12:00Z
$(TAGS)/5.2.4: private AUTHOR_DATE = 2015-02-26T12:00Z
$(TAGS)/5.2.3: private AUTHOR_DATE = 2013-11-11T12:00Z
$(TAGS)/5.2.2: private AUTHOR_DATE = 2013-03-21T12:00Z
$(TAGS)/5.2.1: private AUTHOR_DATE = 2012-06-08T12:00Z
$(TAGS)/5.2.0: private AUTHOR_DATE = 2011-12-12T12:00Z
$(TAGS)/5.1.5: private AUTHOR_DATE = 2012-02-13T12:00Z
$(TAGS)/5.1.4: private AUTHOR_DATE = 2008-08-18T12:00Z
$(TAGS)/5.1.3: private AUTHOR_DATE = 2008-01-21T12:00Z
$(TAGS)/5.1.2: private AUTHOR_DATE = 2007-03-29T12:00Z
$(TAGS)/5.1.1: private AUTHOR_DATE = 2006-06-07T12:00Z
$(TAGS)/5.1: private AUTHOR_DATE = 2006-02-20T12:00Z
$(TAGS)/5.0.3: private AUTHOR_DATE = 2006-06-19T12:00Z
$(TAGS)/5.0.2: private AUTHOR_DATE = 2004-03-17T12:00Z
$(TAGS)/5.0.1: private AUTHOR_DATE = 2003-11-25T12:00Z
$(TAGS)/5.0: private AUTHOR_DATE = 2003-04-11T12:00Z
$(TAGS)/4.0.1: private AUTHOR_DATE = 2002-07-04T12:00Z
$(TAGS)/4.0: private AUTHOR_DATE = 2000-11-06T12:00Z
$(TAGS)/3.2.2: private AUTHOR_DATE = 2000-02-22T12:00Z
$(TAGS)/3.2.1: private AUTHOR_DATE = 1999-11-25T12:00Z
$(TAGS)/3.2: private AUTHOR_DATE = 1999-07-08T12:00Z
$(TAGS)/3.1: private AUTHOR_DATE = 1998-07-12T12:00Z
$(TAGS)/3.0: private AUTHOR_DATE = 1997-07-01T12:00Z
$(TAGS)/2.5: private AUTHOR_DATE = 1996-11-21T12:00Z
$(TAGS)/2.4: private AUTHOR_DATE = 1996-05-17T12:00Z
$(TAGS)/2.2: private AUTHOR_DATE = 1995-11-28T12:00Z
$(TAGS)/2.1: private AUTHOR_DATE = 1995-09-13T12:00Z
$(TAGS)/1.1: private AUTHOR_DATE = 1995-02-02T12:00Z
$(TAGS)/1.0: private AUTHOR_DATE = 1993-07-28T12:00Z

$(TAGS)/5.2.4-rc1: private AUTHOR_DATE = 2015-02-26T12:00Z
$(TAGS)/5.3.0-rc4: private AUTHOR_DATE = 2015-01-06T12:00Z
$(TAGS)/5.3.0-rc3: private AUTHOR_DATE = 2015-01-02T12:00Z
$(TAGS)/5.3.0-rc2: private AUTHOR_DATE = 2014-12-22T12:00Z
$(TAGS)/5.3.0-rc1: private AUTHOR_DATE = 2014-12-16T12:00Z
$(TAGS)/5.3.0-rc0: private AUTHOR_DATE = 2014-12-11T12:00Z
$(TAGS)/5.3.0-beta: private AUTHOR_DATE = 2014-10-23T12:00Z
$(TAGS)/5.3.0-alpha: private AUTHOR_DATE = 2014-07-31T12:00Z
$(TAGS)/5.3.0-work3: private AUTHOR_DATE = 2014-06-19T12:00Z
$(TAGS)/5.3.0-work2: private AUTHOR_DATE = 2014-03-21T12:00Z
$(TAGS)/5.2.3-rc1: private AUTHOR_DATE = 2013-11-11T12:00Z
$(TAGS)/5.3.0-work1: private AUTHOR_DATE = 2013-07-06T12:00Z
$(TAGS)/5.2.2-rc4: private AUTHOR_DATE = 2013-03-21T12:00Z
$(TAGS)/5.2.2-rc3: private AUTHOR_DATE = 2013-03-07T12:00Z
$(TAGS)/5.2.2-rc2: private AUTHOR_DATE = 2013-02-22T12:00Z
$(TAGS)/5.2.2-rc1: private AUTHOR_DATE = 2013-02-19T12:00Z
$(TAGS)/5.2.1-rc4: private AUTHOR_DATE = 2012-06-08T12:00Z
$(TAGS)/5.2.1-rc3: private AUTHOR_DATE = 2012-06-01T12:00Z
$(TAGS)/5.2.1-rc2: private AUTHOR_DATE = 2012-05-28T12:00Z
$(TAGS)/5.2.1-rc1: private AUTHOR_DATE = 2012-05-23T12:00Z
$(TAGS)/5.2.1-work1: private AUTHOR_DATE = 2012-03-21T12:00Z
$(TAGS)/5.1.5-rc2: private AUTHOR_DATE = 2012-02-13T12:00Z
$(TAGS)/5.1.5-rc1: private AUTHOR_DATE = 2012-02-03T12:00Z
$(TAGS)/5.2.0-rc8: private AUTHOR_DATE = 2011-12-12T12:00Z
$(TAGS)/5.2.0-rc7: private AUTHOR_DATE = 2011-12-08T12:00Z
$(TAGS)/5.2.0-rc6: private AUTHOR_DATE = 2011-12-07T12:00Z
$(TAGS)/5.2.0-rc5: private AUTHOR_DATE = 2011-12-05T12:00Z
$(TAGS)/5.2.0-rc4: private AUTHOR_DATE = 2011-11-30T12:00Z
$(TAGS)/5.2.0-rc3: private AUTHOR_DATE = 2011-11-30T12:00Z
$(TAGS)/5.2.0-rc2: private AUTHOR_DATE = 2011-11-25T12:00Z
$(TAGS)/5.2.0-rc1: private AUTHOR_DATE = 2011-11-24T12:00Z
$(TAGS)/5.2.0-beta-rc7: private AUTHOR_DATE = 2011-07-08T12:00Z
$(TAGS)/5.2.0-beta: private AUTHOR_DATE = 2011-07-08T12:00Z
$(TAGS)/5.2.0-beta-rc6: private AUTHOR_DATE = 2011-07-05T12:00Z
$(TAGS)/5.2.0-beta-rc5: private AUTHOR_DATE = 2011-07-04T12:00Z
$(TAGS)/5.2.0-beta-rc4: private AUTHOR_DATE = 2011-06-28T12:00Z
$(TAGS)/5.2.0-beta-rc3: private AUTHOR_DATE = 2011-06-27T12:00Z
$(TAGS)/5.2.0-beta-rc2: private AUTHOR_DATE = 2011-06-21T12:00Z
$(TAGS)/5.2.0-beta-rc1: private AUTHOR_DATE = 2011-06-13T12:00Z
$(TAGS)/5.2.0-alpha-rc4: private AUTHOR_DATE = 2010-11-23T12:00Z
$(TAGS)/5.2.0-alpha: private AUTHOR_DATE = 2010-11-23T12:00Z
$(TAGS)/5.2.0-alpha-rc3: private AUTHOR_DATE = 2010-11-22T12:00Z
$(TAGS)/5.2.0-alpha-rc2: private AUTHOR_DATE = 2010-11-17T12:00Z
$(TAGS)/5.2.0-alpha-rc1: private AUTHOR_DATE = 2010-11-16T12:00Z
$(TAGS)/5.2.0-work5: private AUTHOR_DATE = 2010-10-30T12:00Z
$(TAGS)/5.2.0-work4: private AUTHOR_DATE = 2010-07-31T12:00Z
$(TAGS)/5.2.0-work3: private AUTHOR_DATE = 2010-05-18T12:00Z
$(TAGS)/5.2.0-work2: private AUTHOR_DATE = 2010-01-14T12:00Z
$(TAGS)/5.2.0-work1: private AUTHOR_DATE = 2010-01-08T12:00Z
$(TAGS)/5.1.4-rc3: private AUTHOR_DATE = 2008-08-18T12:00Z
$(TAGS)/5.1.4-rc2: private AUTHOR_DATE = 2008-08-15T12:00Z
$(TAGS)/5.1.4-rc1: private AUTHOR_DATE = 2008-08-12T12:00Z
$(TAGS)/5.1.3-rc5: private AUTHOR_DATE = 2008-01-21T12:00Z
$(TAGS)/5.1.3-rc4: private AUTHOR_DATE = 2008-01-20T12:00Z
$(TAGS)/5.1.3-rc3: private AUTHOR_DATE = 2008-01-19T12:00Z
$(TAGS)/5.1.3-rc2: private AUTHOR_DATE = 2008-01-18T12:00Z
$(TAGS)/5.1.3-rc1: private AUTHOR_DATE = 2008-01-17T12:00Z
$(TAGS)/5.1.2-rc5: private AUTHOR_DATE = 2007-03-29T12:00Z
$(TAGS)/5.1.2-rc4: private AUTHOR_DATE = 2007-03-28T12:00Z
$(TAGS)/5.1.2-rc3: private AUTHOR_DATE = 2007-03-26T12:00Z
$(TAGS)/5.1.2-rc2: private AUTHOR_DATE = 2007-03-25T12:00Z
$(TAGS)/5.1.2-rc1: private AUTHOR_DATE = 2007-03-23T12:00Z
$(TAGS)/5.1.1-rc4: private AUTHOR_DATE = 2006-06-07T12:00Z
$(TAGS)/5.1.1-rc3: private AUTHOR_DATE = 2006-06-05T12:00Z
$(TAGS)/5.1.1-rc2: private AUTHOR_DATE = 2006-06-02T12:00Z
$(TAGS)/5.1.1-rc1: private AUTHOR_DATE = 2006-06-01T12:00Z
$(TAGS)/5.1-rc4: private AUTHOR_DATE = 2006-02-10T12:00Z
$(TAGS)/5.1-rc3: private AUTHOR_DATE = 2006-02-07T12:00Z
$(TAGS)/5.1-rc2: private AUTHOR_DATE = 2006-01-24T12:00Z
$(TAGS)/5.1-rc1: private AUTHOR_DATE = 2006-01-12T12:00Z
$(TAGS)/5.1-beta: private AUTHOR_DATE = 2005-11-18T12:00Z
$(TAGS)/5.1-alpha: private AUTHOR_DATE = 2005-09-09T12:00Z
$(TAGS)/5.1-work6: private AUTHOR_DATE = 2005-05-20T12:00Z
$(TAGS)/5.1-work5: private AUTHOR_DATE = 2005-03-04T12:00Z
$(TAGS)/5.1-work4: private AUTHOR_DATE = 2004-12-30T12:00Z
$(TAGS)/5.1-work3: private AUTHOR_DATE = 2004-12-07T12:00Z
$(TAGS)/5.1-work2: private AUTHOR_DATE = 2004-09-21T12:00Z
$(TAGS)/5.1-work1: private AUTHOR_DATE = 2004-09-02T12:00Z
$(TAGS)/5.1-work0: private AUTHOR_DATE = 2004-03-24T12:00Z
