rendering designs
renderDesign: each on: html
	html
		tableRow: [ html
				tableData: each id;
				tableData: each notes;
				tableData: [ html anchor
						callback: [ self showDetailsOfDesign: each ];
						tbsPullRight;
						with: 'Details' ];
				tableData: [ html anchor
						callback: [ self showResultsOfDesign: each ];
						tbsPullRight;
						with: 'Results' ] ]