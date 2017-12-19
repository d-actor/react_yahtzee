import React, { Component } from 'react';
import { Grid, Button, Divider } from 'semantic-ui-react';
import Die from './Die';

const Board = ({ roll, dice, rollDice }) => {
  let maxRoll = roll === 3;
  let disabled = maxRoll ? { disabled: true } : {}

  return(
    <Grid>
      <Grid.Row>
        <Button
          fluid
          onClick={rollDice}
          {...disabled}
        >
          { maxRoll ? 'Score Roll' : 'Roll' }
        </Button>
        <Grid.Column width={16}>
          <Divider hidden />
        </Grid.Column>
        { roll > 0 && dice.map( (d,i) => <Die key={i} value={d} /> ) }
      </Grid.Row>
    </Grid>
  )
}

export default Board;