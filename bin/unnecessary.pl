#!/usr/bin/env perl

# configure
use constant DIRECTORY => './unnecessary';
use constant LABEL     => 'unnecessary';

# require
use strict;

# initialize
my $counter   = 0;
my $directory = DIRECTORY;
my $label     = LABEL;

# process each sentence21
while ( <DATA> ) {

	# parse
	chop;
	my $sentence = $_;
	
	# increment
	$counter++;
	
	# re-initialize
	my $file = "$directory/$label-" . sprintf( "%04d", $counter ) . '.txt';
	
	# save sentence
	open OUTPUT, " > $file" or die "Can't open $file (!). Call Eric\n";
	print OUTPUT $sentence;
	close OUTPUT;

}

# done
exit;

__DATA__
Elizabeth felt Jane's pleasure.
she had a lively, playful disposition, which delighted in anything ridiculous.
Elizabeth remained with no very cordial feelings towards him.
Elizabeth listened in silence, but was not convinced : their behaviour at the assembly had not been calculated to please in general; and with more quickness of observation and less pliancy of temper than her sister, and with a judgment, too, unassailed by any attention to herself, she was very little disposed to approve them. 
Elizabeth still saw superciliousness in their treatment of everybody, hardly ex-cepting even her sister, and could not like them to her it was equally evident that Jane was yielding to the preference which she had begun to entertain for him from the first, and was in a way to be very much in love ; but she considered with pleasure that it was not likely to be discovered by the world in general, since Jane united with great strength of feeling, a composure of temper and an uniform cheerfulness of manner, which would guard her from the suspicions of the im-pertinent.
Occupied in observing Mr. Bingley's attentions to her sister, Elizabeth was far from suspecting that she was her-self becoming an object of some interest in the eyes of his friend.
Of this she was perfectly unaware : to her he was only the man who made himself agreeable nowhere, and who had not thought her handsome enough to dance with.
Elizabeth was deter-mined ; nor did Sir William at all shake her purpose by his attempt at persuasion.
Elizabeth, feeling really anxious, determined to go to her though the carriage was not to be had : and as she was no-horsewoman, walking was her only alternative. 
Elizabeth was convinced that they held her in contempt for it.
Elizabeth was glad to be taken to her immediately
Elizabeth began to like them herself, when she saw how much affection and solicitude they showed for Jane.
When the clock struck three, Elizabeth felt that she must go, and very unwillingly said so.
To the civil inquiries which then poured in, and amongst which she had the pleasure of distinguishing the much superior solicitude of Mr. Bingley, she could not make a very favourable answer. 
their indifference towards Jane, when not immediately before them, restored Elizabeth to the enjoyment of all her original dis-like.
Their brother, indeed, was the only one of the party whom she could regard with any complacency. 
His anxiety for Jane was evident, and his attentions to herself most pleasing ; and they prevented her feeling herself so much an intruder as she believed she was considered by the others.
She had the comfort of seeing her asleep, and when it appeared to her rather right than pleasant that she should go down stairs herself.
Elizabeth was so much caught by what passed, as to leave her very little attention for her book 
in the morning had the pleasure of being able to send a tolerable answer to the enquiries which she very early received from Mr. Bingley by a housemaid, and some time afterwards from the two elegant ladies who waited on his sisters. 
Elizabeth, for the sake of saying something that might turn her mother's thoughts, now asked her if Char- lotte Lucas had been at Longbourn since her coming away.
Darcy only smiled ; and the general pause which ensued made Elizabeth tremble lest her mother should be exposing herself again. She longed to speak, but could think of nothing to say; and after a short silence Mrs. Bennet began repeating her thanks to Mr. Bingley for his kindness to Jane, with an apology for troubling him also with Lizzy. 
Elizabeth took up some needlework, and was sufficiently amused in attending to what passed between Darcy and his companion.
Elizabeth thought she could perceive that he was rather offended, and therefore checked her laugh. 
while they were thus employed, Elizabeth could not help observing, as she turned over some music-books that lay on the instrument, how frequently Mr. Darcy's eyes were fixed on her.
She hardly knew how to suppose that she could be an object of admiration to so great a man, and yet that he should look at her because he disliked her was still more strange.
She could only imagine, however, at last, that she drew his notice because there was a something about her more wrong and reprehensible, according to his ideas of right, than in any other person present. 
The supposition did not pain her. 
She liked him too little to care for his approbation.
Elizabeth, having rather expected to affront him, was amazed at his gallantry
But Elizabeth, who had not the least inclination to re-main with them,
She then ran gaily off, rejoicing, as she rambled about, in the hope of being at home again in a day or two.
Elizabeth had never seen them so agreeable as they were during the hour which passed before the gentlemen appeared.
Elizabeth, at work in the opposite corner, saw it all with great delight.
Her answer, therefore, was not propitious, at least not to Elizabeth's wishes, for she was impatient to get home.
Against staying longer, however, Elizabeth was positively resolvedónor did she much expect it would be asked ; and fearful, on the contrary, of being considered as intruding themselves needlessly long, she urged Jane to borrow Mr. Bingley's carriage immediately, and at length it was settled that their original design of leaving Nether-field that morning should be mentioned, and the request made.
Elizabeth was chiefly struck with his extraordinary defer- ence for Lady Catherine, and his kind intention of christen-ing, marrying, and burying his parishioners whenever it were required.
Elizabeth happening to see the countenance of both as they looked at each other, was all astonishment at the effect of the meeting.
What could be the meaning of it? It was im-possible to imagine ; it was impossible not to long to know.
when Mr. Wickham walked into the room, Elizabeth felt that she had neither been seeing him before, nor thinking of him since, with the smallest degree of unreasonable admiration. 
Elizabeth was the happy woman by whom he finally seated himself
the agree-able manner in which he immediately fell into conversation, though it was only on its being a wet night, and on the probability of a rainy season, made her feel that the com-monest, dullest, most threadbare topic might be rendered interesting by the skill of the speaker.
Allowing for the common de-mands of the game, Mr. Wickham was therefore at leisure to talk to Elizabeth, and she was very willing to hear him, though what she chiefly wished to hear she could not hope to be told, the history of his acquaintance with Mr. Darcy.
She dared not even mention that gentleman. 
Her curiosity, however, was unexpectedly relieved.
Elizabeth could not but look surprised.
Elizabeth found the interest of the subject increase, and listened with all her heart; but the delicacy of it prevented further enquiry.
Elizabeth honoured him for such feelings, and thought him handsomer than ever as he expressed them.
Elizabeth went away with her head full of him. 
She could think of nothing but of Mr. Wickham, and of what he had told her, all the way home
Elizabeth thought with pleasure of dancing a great deal with Mr. Wickham
Elizabeth's spirits were so high on the occasion, that though she did not often speak unnecessarily to Mr. Collins, she could not help asking him whether he intended to accept Mr. Bingley's invitation, and if he did, whether he would think it proper to join in the evening's amusement
she was rather surprised to find that he entertained no scruple whatever on that head, and was very far from dread-ing a rebuke, either from the Archbishop or Lady Catherine de Bourgh, by venturing to dance.
Elizabeth felt herself completely taken in.
She had fully proposed being engaged by Wickham for those very dances; and to have Mr. Collins instead !-her liveliness had been never worse timed.
She was not the better pleased with his gallantry, from the idea it suggested of something more. 
It now first struck her, that she was selected from among her sisters as worthy of being the mistress of Huns-ford Parsonage, and of assisting to form a quadrille table at Rosings, in the absence of more eligible visitors. 
The idea soon reached to conviction, as she observed his increasing civilities towards herself, and heard his frequent attempt at a compliment on her wit and vivacity; 
though more astonished than gratified herself by this effect of her charms, it was not long before her mother gave her to understand that the probability of their marriage was exceedingly agree-able to her. 
Elizabeth, however, did not choose to take the hint, being well aware that a serious dispute must be the consequence of any reply.
Even Elizabeth might have found some trial of her patience in weather which totally suspended the improvement of her acquaint-ance with Mr. Wickham.
Till Elizabeth entered the drawing-room at Netherfield, and looked in vain for Mr. Wickham among the cluster of red coats there assembled, a doubt of his being present had never occurred to her.
The certainty of meeting him had not been checked by any of those recollections that might not unreasonably have alarmed her.
She had dressed with more than usual care, and prepared in the highest spirits for the conquest of all that remained unsubdued of his heart, trusting that it was not more than might be won in the course of the evening.
But in an instant arose the dread-ful suspicion of his being purposely omitted, for Mr. Darcy's pleasure, in the Bingleys' invitation to the officers.
This part of his intelligence, though unheard by Lydia, was caught by Elizabeth; and, as it assured her that Darcy was not less answerable for Wickham's absence than if her first surmise had been just, every feeling of displeasure against the former was so sharpened by immediate disap-pointment, that she could hardly reply with tolerable civility to the polite enquiries which he directly afterwards ap-proached to make.
She was resolved against any sort of conversation with him, and turned away with a degree of ill-humour which she could not wholly surmount even in speaking to Mr. Bingley, whose blind partiality pro-voked her.
But Elizabeth was not formed for ill-humour; and though every prospect of her own was destroyed for the evening, it could not dwell long on her spirits
Mr. Collins, awkward and solemn, apologising instead of attending, and often moving wrong without being aware of it, gave her all the shame and misery which a disagreeable partner for a couple of dances can give.    
The moment of her release from him was ecstasy.
She danced next with an officer, and had the refreshment of talking of Wickham, and of hearing that he was univer-sally liked.
When those dances were over, she returned to Charlotte Lucas, and was in conversation with her, when she found herself suddenly addressed by Mr. Darcy, who took her so much by surprise in his application for her hand, that, without knowing what she did, she accepted him. 
He walked away again immediately, and she was left to fret over her own want of presence of mind
amazed at the dignity to which she was arrived in being allowed to stand opposite to Mr. Darcy, and reading in her neighboursí looks their equal amazement in beholding it.
she began to imagine that their silence was to last through the two dances, and, at first, was resolved not to break it
till suddenly fancying that it would be the greater punishment to her partner to oblige him to talk, she made some slight obser-vation on the dance.
Eliza-beth, though blaming herself for her own weakness, could not go on. 
Elizabeth instantly read her feelings ; and, at that moment, solicitude for Wickham, resentment against his enemies, and every thing else, gave way before the hope of Jane's being in the fairest way for happiness.
Elizabeth listened with delight to the happy though modest hopes which Jane entertained of Bingley's regard, and said all in her power to heighten her confidence in it.
It vexed her to see him expose himself to such a man.
As Elizabeth had no longer any interest of her own to pursue, she turned her attention almost entirely on her sister and Mr. Bingley; and the train of agreeable reflections which her observations gave birth to made her perhaps almost as happy as Jane. 
She saw her in idea settled in that very house, in all the felicity which a marriage of true affection could bestow; and she felt capable, under such circumstances, of endeavouring even to like Bingley's two sisters. 
Her mother's thoughts she plainly saw were bent the same way, and she determined not to venture near her, lest she might hear too much. 
When they sat down to supper, therefore, she considered it a most unlucky perverseness which placed them within one of each other
deeply was she vexed to find that her mother was talking to that one person (Lady Lucas) freely, openly, and of nothing else but of her ex-pectation that Jane would be soon married to Mr. Bingley.
to her inexpressible vexation she could perceive that the chief of it was over-heard by Mr. Darcy, who sat opposite to them. 
Elizabeth blushed and blushed again with shame and vexation.
She could not help frequently glancing her eye at Mr. Darcy, though every glance convinced her of what she dreaded ; for though he was not always looking at her mother, she was convinced that his attention was invariably fixed by her. 
But not long was the interval of tranquillity ; for when supper was over, singing was talked of, and she had the mortification of seeing Mary, after very little entreaty, preparing to oblige the company.
By many significant looks and silent entreaties did she endeavour to prevent such a proof of complaisance,-but in vain
Elizabeth's eyes were fixed on her, with most painful sen-sations; and she watched her progress through the several stanzas with an impatience which was very ill rewarded at their close 
Elizabeth was in agonies.
She looked at her father to entreat his interference, lest Mary should be singing all night. 
Elizabeth, sorry for her, and sorry for her father's speech, was afraid her anxiety had done no good. 
To Elizabeth it appeared, that had her family made an agreement to expose themselves as much as they could during the evening, it would have been impossible for them to play their parts with more spirit, or finer success
she could not determine whether the silent contempt of the gentleman, or the insolent smiles of the ladies, were more intolerable.
The rest of the evening brought her little amusement.
She felt it to be the probable consequence of her allusions to Mr. Wickham, and rejoiced in it.
Elizabeth would not oppose such an injunction; and a moment's consideration making her also sensible that it would be wisest to get it over as soon and as quietly as possible, she sat down again, and tried to conceal, by in-cessant employment, the feelings which were divided be-tween distress and diversion. 
The idea of Mr. Collins, with all his solemn composure, being run away with by his feelings, made Elizabeth so near laughing that she could not use the short pause he allowed in any attempt to stop him farther
It was absolutely necessary to interrupt him now.
determined, that if he persisted in considering her re-peated refusals as flattering encouragement, to apply to her father, whose negative might be uttered in such a manner as must be decisive, and whose behaviour at least could not be mistaken for the affectation and coquetry of an elegant female.
Though her manner varied, however, her determination never did.
The discussion of Mr. Collins's offer was now nearly at an end, and Elizabeth had only to suffer from the uncomfort-able feelings necessarily attending it, and occasionally from some peevish allusion of her mother.
Elizabeth had hoped that his resent-ment might shorten his visit, but his plan did not appear in the least affected by it.
She highly approved his forbearance
she felt all the compliment it offered to herself; and it was most acceptable as an occasion of introducing him to her father and mother.
To these high-flown expressions Elizabeth listened with all the insensibility of distrust; and though the suddenness of their removal surprised her, she saw nothing in it really to lament 
as to the loss of their society, she was persuaded that Jane must soon cease to regard it in the enjoyment of his.
The idea of his returning no more Elizabeth treated with the utmost contempt. 
It appeared to her merely the sug-gestion of Caroline's interested wishes; and she could not for Â moment suppose that those wishes, however openly or artfully spoken, could influence a young man so totally inde-pendent of every one.
The possibility of Mr. Collins's fancying himself in love with her friend had once occurred to Elizabeth within the last day or two
her astonishment was consequently so great as to overcome at first the bounds of decorum, and she could not help crying out
But Elizabeth had now recollected herself; and, making a strong effort for it, was able to assure her, with tolerable firmness, that the prospect of their relationship was highly grateful to her, and that she wished her all imaginable happiness.
It was a long time before she became at all reconciled to the idea of so unsuitable a match. 
117. And to the pang of a friend disgracing herself, and sunk in her esteem, was added the distressing conviction that it was impossible for that friend to be tolerably happy in the lot she had chosen.
ELIZABETH was sitting with her mother and sisters, reflecting on what she had heard, and doubting whether she was authorised to mention it, when Sir William Lucas himself appeared, sent by his daughter to announce her en-gagement to the family.
Elizabeth, feeling it incumbent on her to relieve him from so unpleasant a situation, now put herself forward to confirm his account, by mentioning her prior knowledge of it from Charlotte herself; and endeavoured to put a stop to the ex-clamations of her mother and sisters, by the earnestness of her congratulations to Sir William, in which she was readily joined by Jane, and by making a variety of remarks on the happiness that might be expected from the match, the ex- cellent character of Mr. Collins, and the convenient distance of Hunsford from London.
Elizabeth felt persuaded that no real confidence could ever subsist between them again.
Her disappointment in Charlotte made her turn with fonder regard to her sister, of whose rectitude and delicacy she was sure her opinion could never be shaken, and for whose happiness she grew daily more anxious, as Bingley had now been gone a week, and nothing was heard of his return.
Even Elizabeth began to fear-not that Bingley was in-differentóbut that his sisters would be successful in keeping him away.
Unwilling as she was to admit an idea so de-structive of Jane's happiness, and so dishonourable to the stability of her lover, she could not prevent its frequently recurring. 
Her heart was divided between concern for her sister and resentment against all others.
That he was really fond of Jane, she doubted no more than she had ever done ; and much as she had always been disposed to like him, she could not think without anger, hardly without contempt, on that easiness of temper, that want of proper resolution, which now made him the slave of his designing friends, and led him to sacrifice his own happiness to the caprice of their inclinations. 
She could think of nothing else
Elizabeth could not oppose such a wish
Elizabeth was exceedingly pleased with this proposal, and felt persuaded of her sister's ready acquiescence.
But, in spite of the certainty in which Elizabeth affected to place this point, as well as the still more interesting one of Bingley's being withheld from seeing Jane, she felt a solicitude on the subject which convinced her, on examina-tion, that she did not consider it entirely hopeless.
Thursday was to be the wedding day, and on Wednesday Miss Lucas paid her farewell visit ; and when she rose to take leave, Elizabeth, ashamed of her mother's ungracious and reluctant good wishes, and sincerely affected herself, accompanied her out of the room. 
Elizabeth could not refuse, though she foresaw little pleasure in the visit.
Elizabeth could never address her without feeling that all the comfort of intimacy was over ; and, though determined not to slacken as a correspondent, it was for the sake cf what had been ather than what was.
Charlotte's first letters were received with a good deal of eagerness : there could not but be curiosity to know how she would speak of her new home, how she would like Lady Catherine, and how happy she would dare pronounce herself to be; though, when the letters were read, Elizabeth felt that Charlotte expressed herself on every point exactly as she might have foreseen.
Jane had already written a few lines to her sister, to an-nounce their safe arrival in London ; and when she wrote again, Elizabeth hoped it would be in her power to say something of the Bingleys.
It convinced her that accident only could discover to Mr. Bingley her sister's being in town.
This letter gave Elizabeth some pain; but her spirits re-turned, as she considered that Jane would no longer be duped, by the sister at least.
She would not even wish for any renewal of his attentions.
His character sunk on every review of it; and, as a punishment for him, as well as a possible advantage to Jane, she seriously hoped he might really soon marry Mr. Darcy's sister, as, by Wickham's account, she would make him abundantly regret what he had thrown away.
Elizabeth was watchful enough to see it all, but she could see it and write of it without material pain. 
Her heart had been but slightly touched, and her vanity was satisfied with believing that she would have been his only choice, had fortune permitted it.
Elizabeth, less clear sighted perhaps in this case than in Charlotte's, did not quarrel with him for his wish of independence.
while able to suppose that it cost him a few struggles to relinquish her, she was ready to allow it a wise and desirable measure for both, and could very sincerely wish him happy.
She had not at first thought very seriously of going thither ; but Charlotte, she soon found, was depending on the plan, and she gradually learned to consider it herself with greater pleasure as well as greater certainty.
Absence had increased her desire of seeing Charlotte again, and weakened her disgust of Mr. Collins.
The journey would, moreover, give her a peep at Jane; and, in short, as the time drew near, she would have been very sorry for any delay.
The only pain was in leaving her father, who would cer-tainly miss her, and who, when it came to the point, so little liked her going, that he told her to write to him, and almost promised to answer her letter.
in his man-ner of bidding her adieu, wishing her every enjoyment, reminding her of what she was to expect in Lady Catherine de Bourgh, and trusting their opinion of herótheir opinion of every bodyówould always coincide, there was a solicitude, an interest, which she felt must ever attach her to him with a most sincere regard ; and she parted from him convinced, that, whether married or single, he must always be her model of the amiable and pleasing.
Elizabeth loved absurdities, but she had known Sir William's too long. 
when they entered the passage, she was there to welcome them, and Elizabeth looking earnestly in her face, was pleased to see it healthful and lovely as ever.
she was more grieved than astonished to hear, in reply to her minute enquiries, that though Jane always struggled to support her spirits, there were periods of dejection. 
Before they were separated by the conclusion of the play, she had the unexpected happiness of an invitation to ac-company her uncle and aunt in a tour of pleasure which they proposed taking in the summer.
No scheme could have been more agreeable to Elizabeth, and her acceptance of the invitation was most ready and grateful.
EVERY object in the next day's journey was new and in-teresting to Elizabeth ; and her spirits were in a state of enjoyment ; for she had seen her sister looking so well as to banish all fear for her health, and the prospect of her northern tour was a constant source of delight.
Mrs. Collins welcomed her friend with the liveliest pleasure, and Eliza-beth was more and more satisfied with coming, when she found herself so affectionately received.
She saw instantly that her cousin's manners were not altered by his marriage
Elizabeth was prepared to see him in his glory; and she could not help fancying that in displaying the good propor-tion of the room, its aspect, and its furniture, he addressed himself particularly to her, as if wishing to make her feel what she had lost in refusing him.
Elizabeth admired the command of countenance with which Charlotte talked of the healthfulness of the exercise, and owned she encouraged it as much as possible.
Elizabeth supposed he must be often forgotten.
It was rather small, but well built and convenient; and every thing was fitted up and arranged with a neatness and consistency, of which Elizabeth gave Charlotte all the credit. 
She had already learnt that Lady Catherine was still in the country.
The evening was spent chiefly in talking over Hertford-shire news, and telling again what had been already written ; and when it closed, Elizabeth, in the solitude of her chamber, had to meditate upon Charlotte's degree of con-tentment, to understand her address in guiding, and com-posure in bearing, with her husband, and to acknowledge that it was all done very well.
She had also to anticipate how her visit would pass, the quiet tenour of their usual employments, the vexatious interruptions of Mr. Collins, and the gaieties of their intercourse with Rosings.
Every park has its beauty and its prospects; and Elizabeth saw much to be pleased with, though she could not be in such raptures as Mr. Collins expected the scene to inspire, and was but slightly affected by his enumeration of the windows in front of the house, and his relation of what the glazing altogether had originally cost Sir Lewis de Bourgh.
Elizabeth's courage did not fail her.
She had heard nothing of Lady Catherine that spoke her awful from any extraordinary talents or miraculous virtue, and the mere stateliness of money and rank she thought she could witness without trepidation.
Elizabeth found herself quite equal to the scene, and could observe the three ladies before her composedly. 
from the observation of the day altogether, she believed Lady Catherine to be exactly what he had repre-sented.
When, after examining the mother, in whose countenance and deportment she soon found some resemblance of Mr. Darcy, she turned her eyes on the daughter, she could almost have joined in Maria's astonishment at her being so thin and so small.
every dish was commended first by him, and then by Sir William, who was now enough re- covered to echo whatever his son-in-law said, in a manner which Elizabeth wondered Lady Catherine could bear.
Elizabeth was ready to speak whenever there was an opening, but she was seated between Charlotte and Miss De Bourghóthe former of whom was engaged in listening to Lady Catherine, and the latter said not a word to her all dinner-time.
Elizabeth found that nothing was beneath this great lady's attention which could furnish her with an occasion for dictating to others. 
Elizabeth felt all the impertinence of her questions, but answered them very composedly.
Elizabeth suspected herself to be the first creature who had ever dared to trifle with so much dignified impertinence.
As soon as they had driven from the door, Elizabeth was called on by her cousin to give her opinion of all that she had seen at Rosings, which, for Charlotte's sake, she made more favourable than it really was. 
when he went away, the whole family returned to their usual employments, and Elizabeth was thankful to find that they did not see more of her cousin by the altera- tion; for the chief of the time between breakfast and dinner was now passed by him either at work in the garden, or in reading and writing, and looking out of window in his own book room, which fronted the road. 
Elizabeth at first had rather won-dered that Charlotte should not prefer the dining parlour for common use; it was a better sized room, and had a pleasanter aspect : but she soon saw that her friend had an excellent reason for what she did, for Mr. Collins would undoubtedly have been much less in his own apartment had they sat in one equally lively; and she gave Charlotte credit for the arrangement.
till Elizabeth recollected that there might be other family livings to be disposed of, she could not understand the sacrifice of so many hours.
This, however, was no evil to Elizabeth, and upon the whole she spent her time comfortably enough
Her favourite walk, and where she frequently went while the others were calling on Lady Catherine, was along the open grove which edged that side of the park where there was a nice sheltered path, which no one seemed to value but herself, and where she felt beyond the reach of Lady Catherine's curiosity.
Elizabeth had heard, soon after her arrival, that Mr. Darcy was expected there in the course of a few weeks; and though there were not many of her acquaintance whom she did not prefer, his com-ing would furnish one comparatively new to look at in their Rosings parties, and she might be amused in seeing how hopeless Miss Bingley's designs on him were, by his be-haviour to his cousin, for whom he was evidently destined by Lady Catherine
She was perfectly sensible that he never had : but she wished to see whether he would betray any consciousness of what had passed between the Bingleys and Jane; and she thought he looked a little confused as he answered that he had never been so fortunate as to meet Miss Bennet.
He now seated himself by her, and talked so agree-ably of Kent and Hertfordshire, of travelling and staying at home, of new books and music, that Elizabeth had never been half so well entertained in that room before
Elizabeth looked at Darcy to see how cordially he as-sented to his cousin's praise : but neither at that moment nor at any other could she discern any symptom of love; and from the whole of his behaviour to Miss De Bourgh she derived this comfort for Miss Bingley, that he might have been just as likely to marry her, had she been his relation.
As she had heard no carriage, she thought it not unlikely to be Lady Catherine ; and under that apprehension was putting away her half-finished letter, that she might escape all impertinent questions, when the door opened, and to her very great sur-prise Mr. Darcy, and Mr. Darcy only, entered the room.
It was absolutely necessary, therefore, to think of something; and in this emergency recollecting when she had seen him last in Hertfordshire, and feeling curious to know what he would say on the subject of their hasty de-parture,
She was afraid of talking longer of his friend ; and, having nothing else to say, was now determined to leave the trouble of finding a subject to him.
As he spoke there was a sort of smile, which Elizabeth fancied she understood; 
Elizabeth was reminded by her own satisfaction in being with him, as well as by his evident admiration of her former favourite, George Wickham ; and though, in comparing them, she saw there was less captivating softness in Colonel Fitzwilliam's manners, she believed he might have the best informed mind.
She felt all the per-verseness of the mischance that should bring him where no one else was brought
it struck her in the course of their third rencounter that he was asking some odd unconnected questions about her pleasure in being at Hunsford, her love of solitary walks, and her opinion of Mr. and Mrs. Collins's happiness.
She supposed, if he meant any thing, he must mean an allusion to what might arise in that quarter. 
It distressed her a little, and she was quite glad to find herself at the gate in the pales opposite the Parsonage.
As she spoke, she observed him looking at her earnestly; and the manner in which he immediately asked her why she supposed Miss Darcy likely to give them any uneasiness, con-vinced her that she had somehow or other got pretty near the truth. 
This was spoken jestingly, but it appeared to her so just a picture of Mr. Darcy, that she would not trust herself with an answer 
There, shut into her own room, as soon as their visitor left them, she could think without interruption of all that she had heard. 
That he had been concerned in the measures taken to separate Mr. Bingley and Jane, she had never doubted ; but she had always attributed to Miss Bingley the principal design and arrangement of them.
When she thought of her mother, indeed, her confidence gave way a little ; 
she would not allow that any objections there had material weight with Mr. Darcy, whose pride, she was convinced, would receive a deeper wound from the want of importance in his friend's connections than from their want of sense; 
and she was quite decided, at last, that he had been partly governed by this worst kind of pride, and partly by the wish of retaining Mr. Bingley for his sister.
it grew so much worse towards the evening that, added to her unwillingness to see Mr. Darcy, it determined her not to attend her cousins to Rosings, where they were engaged to drink tea.
When they were gone, Elizabeth, as if intending to exas-perate herself as much as possible against Mr. Darcy, chose for her employment the examination of all the letters which Jane had written to her since her being in Kent.
Elizabeth noticed every sentence conveying the idea of uneasiness, with an attention which it had hardly received on the first perusal. 
Mr. Darcy's shameful boast of what misery he had been able to inflict gave her a keener sense of her sister's sufferings.
It was some consolation to think that his visit to Rosings was to end on the day after the next, and a still greater that in less than a fortnight she should herself be with Jane again, and enabled to contribute to the recovery of her spirits, by all that affection could do.
She could not think of Darcy's leaving Kent without remembering that his cousin was to go with him ; but Colonel Fitzwilliam had made it clear that he had no in-tentions at all, and, agreeable as he was, she did not mean to be unhappy about him.
While settling this point, she was suddenly roused by the sound of the door bell; and her spirits were a little fluttered by the idea of its being Colonel Fitzwilliam himself, who had once before called late in the evening, and might now come to enquire particularly after her. 
But this idea was soon banished, and her spirits were very differently affected, when, to her utter amazement, she saw Mr. Darcy walk into the room. 
Elizabeth's astonishment was beyond expression. 
In spite of her deeply-rooted dislike, she could not be insensible to the compliment of such a man's affection, and though her intentions did not vary for an instant, she was at first sorry for the pain he was to receive; till roused to resentment by his subsequent language, she lost all com-passion in anger.
She tried, however, to compose herself to answer him with patience, when he should have done.
Such a circumstance could only exasperate farther
The pause was to Elizabeth's feelings dreadful. 
She paused, and saw with no slight indignation that he was listening with an air which proved him wholly unmoved by any feeling of remorse.
Elizabeth felt herself growing more angry every moment
The tumult of her mind was now painfully great. 
Her astonishment, as she reflected on what had passed, was in- creased by every review of it. 
it was gratifying to have inspired unconsciously so strong an affection.
But his pride, his abominable pride, his shameless avowal of what he had done with respect to Jane, his unpardonable assurance in acknowledging, though he could not justify it, and the un- feeling manner in which he had mentioned Mr. Wickham, his cruelty towards whom he had not attempted to deny, soon overcame the pity which the consideration of his attachment had for a moment excited.
She continued in very agitating reflections till the sound of Lady Catherine's carriage made her feel how unequal she was to encounter Charlotte's observation, and hurried her away to her room.
ELIZABETH awoke the next morning to the same thoughts and meditations which had at length closed her eyes.
She could not yet recover from the surprise of what had hap-pened : it was impossible to think of any thing else; and, totally indisposed for employment, she resolved soon after breakfast to indulge herself in air and exercise. 
After walking two or three times along that part of the lane, she was tempted, by the pleasantness of the morning, to stop at the gates and look into the park.
She was on the point of con-tinuing her walk, when she caught a glimpse of a gentleman within the sort of grove which edged the park : he was moving that way; and fearful of its being Mr. Darcy, she was directly retreating.
With no expectation of pleasure, but with the strongest curiosity, Elizabeth opened the letter, and to her still in-creasing wonder, perceived an envelope containing two sheets of letter paper, written quite through, in a very close hand.
As he quitted the room, Elizabeth felt how improbable it was that they should ever see each other again on such terms of cordiality as had marked their several meetings in Derby-shire; and as she threw a retrospective glance over the whole of their acquaintance, so full of contradictions and varieties, sighed at the perverseness of those feelings which would now have promoted its continuance, and would formerly have rejoiced in its termination.
She was humbled, she was grieved; 
she repented, though she hardly knew of what. 
She became jealous of his esteem, when she could no longer hope to be benefited by it. 
She wanted to hear of him, when there seemed the least chance of gaining
intelligence. 
She was convinced that she could have been happy with him, when it was no longer likely they should meet.
She began now to comprehend that he was exactly the man who, in disposition and talents, would most suit her.
