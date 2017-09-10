PWD=$(shell pwd)
TOOLS=$(PWD)/cms/tools
CMS_DIR=$(PWD)/cms
ALL_CONTENT="$(wildcard videos/*)"
ALL_CONTENT+= "$(wildcard articles/*)"
ALL_CONTENT+= "$(wildcard fiction/*)"
ALL_CONTENT+= "$(wildcard audio/*)"
ALL_CONTENT+= "$(wildcard audio/transcripts/*)"
.PHONY: timestamp index sync $(ALL_CONTENT)

default: index

index: $(CMS_DIR)/index.html

timestamp: $(ALL_CONTENT)
	git annex metadata --force -s timestamp\?=untagged
	$(TOOLS)/add_timestamp_to_untagged

editorialise: $(ALL_CONTENT)
	git annex metadata --force -s editorial\?=none
	$(TOOLS)/editorialise

sync:
	git annex sync

$(CMS_DIR)/index.html: timestamp
	WORKING_DIR=$(CMS_DIR) $(TOOLS)/generate_index header.html footer.html
