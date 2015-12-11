# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

#This page is for multiple selection dropdown functionality.

jQuery ->
	$(".content li").on "click", ->
		value = this.id
		main = $('#'+value).attr('class')
		$(this).toggleClass "scrolling glyphicon-ok", ->
			if $(this).hasClass "scrolling"
				#alert value+" "+main
				$("td."+main+"+"+value).show
				#alert "."+main+"+"+value
				$.get('/scrolls/show',{outside:main,inside:value}).done (data,status,e) ->
					console.log status
					$('#show_slider').append('<div id="slider_'+main+'_'+value+'"></div>')
					$('#slider_'+main+'_'+value).append data
					
			else
				main = main.split(" ")
				#alert value+" "+main[0]
				$("div").remove('#slider_'+main[0]+'_'+value)
				$('tr>td.'+main[0]+'+'+value).hide()
				console.log "td ."+main[0]+"+"+value


	$('.header').click ->
  		$header = $(this)
  		$content = $header.next()
  		$content.slideToggle 500

# Code Below is for Autocomplete that is for comparing two or more states with respect to
# their fields choosen by the client

###
$.getJSON("/cipher/search_suggestions").done (searchData) ->
		console.log(searchData)
		split = (val) ->
  			val.split /,\s/ #insert * before last '/'
		extractLast = (term) ->
  			split(term).pop()
		$('#search_suggest').bind('keydown', (event) ->
  			if event.keyCode == $.ui.keyCode.TAB and $(this).autocomplete('instance').menu.active
    		event.preventDefault()
  			return
		).autocomplete
  			minLength: 0
  			source: (request, response) ->
    		# delegate back to autocomplete, but extract the last term
    			response $.ui.autocomplete.filter(searchData, extractLast(request.term))
    			return
  			focus: ->
    		# prevent value inserted on focus
    			false
  			select: (event, ui) ->
    			terms = split(value)
    			# remove the current input
    			terms.pop()
    			# add the selected item
    			terms.push ui.item.value
    			#console.log(terms)
    			showPage(terms[terms.length-1])
    			# add placeholder to get the comma-and-space at the end
    			terms.push ''
    			value = terms.join(', ')
    			false
				return
		return
	showPage = (value) ->
		console.log(value)
		$.get('/cipher/output',{name: value}).done (data,status,e) ->
			#alert(e.responseText)
			$("#show_output").append(e.responseText)
			return
###

# Code Below is comment for future use

#	$("#select-element li").on "click", ->
#		values = this.id
#		main = $('#'+values).attr('class')
#		alert(values+" "+main)
#	$("select-element").selectMultiple
#		afterSelect: (values) ->
#		$("#select-element li").on "click", ->
#			values = this.id
#			main = $('#'+values).attr('class')
#			alert(values+" "+main)
#			$.get('/scrolls/show',{outside:main,inside:values}).done (data,status,e) ->
#				console.log data
#				$('#show_slider').append('<div id="slider_'+main+'_'+values+'"></div>')
#				$('#slider_'+main+'_'+values).append data
#		afterDeselect: (values) ->
#			main = $('#'+values).attr('class')
#			$("div").remove('#slider_'+main+'_'+values)
