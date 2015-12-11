

var Toggle = React.createClass({
	getInitialState:function(){
		return {buttonValue:"Table View", showResults:false};
	},
	toggleView:function(e){
		if(this.state.showResults){
			this.setState({buttonValue:"Table View",showResults: false});
		}else{
			this.setState({buttonValue:"Graph View",showResults: true});
		}
	},
	render: function(){
		return(<div id="view_toggle"><input type="submit" id="toggle_submit" value={this.state.buttonValue} onClick={this.toggleView} />
			{this.state.showResults ?<ShowValues/>:<ContainerGraph/>}</div>);
	}
});

var ShowValues = React.createClass({
	render:function(){
		return(<div id="show_values" className="toggled_view"></div>);
	}
})
var ContainerGraph = React.createClass({
	render:function(){
		return(<div id="container_graph" className="toggled_view"></div>);
	}
})