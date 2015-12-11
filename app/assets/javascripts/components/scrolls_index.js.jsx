

var ScrollsIndex = React.createClass({
	getInitialState:function(){
		return {
			states: this.props.initialStates
		};
	},
	render: function(){
		var eachForestarea = Object.keys(this.state.states.forestarea).map(function(item,value){
			return(<li className="forestarea" id={item}>{item}</li>)
		});
		var eachEmployment = Object.keys(this.state.states.employment).map(function(item,value){
			return(<li className="employment" id={item}>{item}</li>)
		});
		var eachLiteracyrate = Object.keys(this.state.states.literacyrate).map(function(item,value){
			return(<li className="literacyrate" id={item}>{item}</li>)
		});
		var eachMentowoman = Object.keys(this.state.states.mentowoman).map(function(item,value){
			return(<li className="mentowoman" id={item}>{item}</li>)
		});
		return (
			<div className="container">
					<div className="header parent">
						<span>Select Criterion</span>
					</div>
					<div className="content parent">
						<div className="header child"><span>Forestarea</span></div>
						<div className="content child"><ul>{eachForestarea}</ul></div>
						<div className="header child"><span>Employment</span></div>
						<div className="content child"><ul>{eachEmployment}</ul></div>
						<div className="header child"><span>Literacy Rate</span></div>
						<div className="content child"><ul>{eachLiteracyrate}</ul></div>
						<div className="header child"><span>Men to Woman</span></div>
						<div className="content child"><ul>{eachMentowoman}</ul></div>
					</div>
				</div>);
	}
});

