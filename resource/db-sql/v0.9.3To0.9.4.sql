INSERT INTO ALONE_APP_VERSION VALUES ('v0.9.4',  now(), 'USERNAME');
ALTER TABLE wts_subject_answer ADD INDEX SUBJECTANSWER_VERSIONID (VERSIONID);
ALTER TABLE wts_paper_subject ADD INDEX PAPERSUBJECT_PID_SID (PAPERID,SUBJECTID);