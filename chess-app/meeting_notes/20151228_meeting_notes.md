## December 28, 2015 Meeting Notes

We started focusing on the edge cases of chess (Castling, En Passant, and Promotion)
Add 5 tickets to the Trello Board

1. Castling logic - this will allow a king to move two spaces and a rook to move to the other side of the king. Right now our validation doesn't allow a move of more than one space for a king and a rook cannot make an obstructed move
2. UI for castling - We determined how we want the user to indicate that they want to castle their rook and king
3. En Passant - We specified the rules for En Passant and now we need to build out the logic in the game model
4. UI for promotion - We specified that we want to display a modal when the pawn reaches the end of the board so that a user can select the piece to promote to
5. Save Game - We specified that we want to allow a user to resume a previously started game.
