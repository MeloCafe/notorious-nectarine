use dep::std;

fn main(
    governor: Field,
    block_hash: Field,
    proposal_id: Field,
    // todo: no variable length arrays, or arrays of structs
    votes: [u64; 2],
    _signatures: [u8; 1],
    _accountProofs: [u8; 1],
    _storageProofs: [u8; 1]
) -> pub [Field; 3] {
    let mut lastId: u64 = 0;

    for i in 0..2 {
        // votes must be in order so we cannot have duplicates
        constrain lastId < votes[i];
        // todo: verify the signature over the vote id
        // todo: verify the merkle proofs proving ownership of the token id
        lastId = votes[i];
    };

    [governor, block_hash, proposal_id]
}
