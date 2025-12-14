# STOP: Read Prerequisites First

Before reading this strategy document, you MUST read these foundational writing guides in order:

1. Read ~/.claude/writing-guides/paragraphs.md
2. Read ~/.claude/writing-guides/style-guide.md
3. Read ~/.claude/writing-guides/tables.md
4. Read ~/.claude/writing-guides/lists.md
5. Read ~/.claude/writing-guides/faqs.md

**Why this order matters:** These guides define HOW to write. The strategy below defines WHAT to write. You cannot execute the strategy without understanding these fundamentals.

**Only after reading all guides above, continue to "Phase 1" below.**

---

# Complete Blog Article Writer Agent Strategy
## Niche-Agnostic Framework for Service-Supporting Blog Content

---

## Required Inputs for Article Generation

The writer agent requires these inputs:

### 1. **Brief** 
Contains all context layers as specified in Phase 1

### 2. **Main Service Page URL** 
For the single internal link in the opening paragraphs

### 3. **Business Details & Trust Signals**
Provide all available credentials to position as expert:

**Basic Information:**
- Business name
- Location (city, state/province)
- Years in business / established date
- Service area coverage

**Credentials & Qualifications:**
- Licenses and license numbers
- Certifications (industry-specific)
- Professional associations/memberships
- Insurance coverage amounts
- Bonding information

**Experience & Authority:**
- Number of projects completed
- Specializations or focus areas
- Team qualifications (e.g., "5 master plumbers")
- Awards or recognition received
- Media mentions or features

**Trust Signals:**
- Google/BBB ratings
- Number of reviews
- Warranty terms offered
- Guarantees provided
- Emergency response times
- Notable clients or projects (if applicable)

**Unique Differentiators:**
- Proprietary processes or methods
- Exclusive partnerships or products
- Special equipment or technology
- Unique service offerings
- Community involvement

**Example Input Format:**
```
BUSINESS_NAME: CONCRETE SURFACES
LOCATION: Windsor, Ontario
ESTABLISHED: 2015
LICENSE: Ontario Contractor License #12345
CERTIFICATIONS: Certified Polyaspartic Installer, SSPC Concrete Coating Specialist
INSURANCE: $2 million liability coverage
COMPLETED_PROJECTS: 500+ residential garage floors
SPECIALIZATION: Residential garage floor coatings, specializing in polyaspartic and epoxy
TEAM: 3 certified installers, each with 5+ years experience
REVIEWS: 4.9 stars from 187 Google reviews
WARRANTY: Lifetime warranty on materials, 5-year installation warranty
UNIQUE: Only certified installer of ArmorGarage products in Windsor area
RESPONSE_TIME: Same-day estimates, installation within 5 days
```

**Usage in Article:**
These real credentials should be woven naturally throughout:
- Topic sentence can include years/specialization
- Quick answer section can mention certifications
- Trust signals distributed where relevant
- Never force all credentials into one paragraph
- Use specific numbers over vague claims

---

## Output Instructions

**File Location:** Save the completed article to `/output/` directory from the working directory

**File Naming:** Use kebab-case version of the article title from the brief
- Convert to lowercase
- Replace spaces and special characters with hyphens
- Remove multiple consecutive hyphens
- Add `.json` extension

**Filename Examples:**
- Title: "Clear Coat vs Colored Epoxy: Preserving vs Transforming Your Concrete"
- Filename: `clear-coat-vs-colored-epoxy-preserving-vs-transforming-your-concrete.json`

- Title: "UV Yellowing: Choosing Garage Floor Coatings That Won't Fade"
- Filename: `uv-yellowing-choosing-garage-floor-coatings-that-wont-fade.json`

**JSON Output Format (Required):**
```json
{
  "post_title": "Choosing Between Clear Coat and Colored Epoxy for Your Garage Floor",
  "meta_title": "Clear Coat vs Colored Epoxy Garage Floor | Windsor Coating Guide | Costs & Durability 2025",
  "meta_description": "Comparing clear coat and colored epoxy for garage floors? See real costs, 20-year durability data, and which option hides flaws best. Free Windsor quotes.",
  "meta_keywords": "clear coat garage floor, colored epoxy, garage floor coating, epoxy flooring Windsor, concrete coating comparison, UV resistant coating, polyaspartic topcoat, garage floor aesthetics, floor protection",
  "post_content": "<p>CONCRETE SURFACES is Windsor's trusted garage floor coating specialist that helps homeowners choose between preservation and transformation for lasting floor protection. The decision between clear coat and colored epoxy affects not just how your garage looks, but how it performs over the next 15-20 years. Through our <a href=\"https://example.com/garage-floor-coating\">professional epoxy flooring services</a>, we've helped hundreds of Windsor homeowners make this choice based on their concrete's condition, design preferences, and long-term goals.</p>\n\n<p>Clear coat epoxy preserves and enhances your concrete's natural character, creating a glossy, showroom-quality finish that many homeowners love for its sophisticated appearance. This option works best when your concrete is in excellent condition without significant staining, cracks, or patches that need concealing.</p>\n\n<section id=\"comparison-overview\">\n<h2>Understanding Your Options: Clear Coat and Colored Epoxy</h2>\n<p>...</p>\n</section>",
  "post_slug": "clear-coat-vs-colored-epoxy-garage-floor"
}
```

**JSON Field Descriptions:**
- `post_title`: Natural title that becomes the H1 in WordPress
- `meta_title`: SEO-optimized title tag (up to 120 chars)
- `meta_description`: SEO meta description (155-160 chars)
- `meta_keywords`: Comma-separated keywords ordered by importance (max 25)
- `post_content`: Full HTML content (no H1, WordPress creates it)
- `post_slug`: URL-friendly kebab-case slug


---

## Phase 1: Brief Analysis & Content Classification

### 1.1 Initial Brief Extraction
From every brief, extract these elements in order:

```
PRIMARY IDENTIFIERS:
- ID: [unique identifier]
- TITLE: [provided title/topic]
- KEYWORD: [primary keyword to target]
- QUERIES: [related search queries]
- ARCHETYPE: [Comparison | How-to Guide | Technical Deep-Dive | Buyer's Guide | Problem/Solution]
- CATEGORY: [topic category]

CONTEXT LAYERS:
EMOTIONAL (ranked by importance):
1. [Primary emotional driver - fear/desire/concern]
2. [Secondary emotional state]
3. [Underlying feeling]

FUNCTIONAL (ranked by importance):
1. [Primary practical need]
2. [Secondary functional requirement]
3. [Additional practical consideration]

TRUST (ranked by importance):
1. [Primary credibility need]
2. [Secondary trust signal]
3. [Additional authority requirement]

BUSINESS CONTEXT:
- NAME: [Business name]
- INDUSTRY: [Service type]
- LOCATION: [City, State/Province]
- AUDIENCE: [Target customer]
- EXPERTISE: [Specialization]
```

### 1.2 Content Classification Decision Tree

**Step 1: YMYL Assessment**
Does this topic significantly impact:
- Health, medical, or mental wellbeing?
- Financial security or major financial decisions?
- Safety and physical wellbeing?
- Legal rights and obligations?

**If YES → MANDATORY: Read ~/.claude/writing-guides/ymyl.md NOW**
- **DO NOT proceed to Phase 2 without reading ymyl.md**
- YMYL content without proper qualifications can harm readers
- All YMYL guidelines are non-negotiable requirements

**If NO → Proceed with standard positioning and voice**

**Step 2: Industry Category Identification**
- **Home Services:** plumbing, HVAC, roofing, flooring, electrical, landscaping
- **Professional Services:** legal, accounting, consulting, real estate
- **Health Services:** dental, medical, therapy, wellness (YMYL)
- **Technical Services:** IT, security, automation, repairs
- **Creative Services:** design, marketing, photography, writing
- **Emergency Services:** 24/7 plumbing, HVAC, electrical, restoration

### 1.3 Intent Analysis Framework

**Primary Intent (from archetype):**
- **Comparison:** User comparing options, needs decision framework
- **How-to:** User wants process/steps, considering DIY vs professional
- **Technical:** User seeking understanding of problem/concept
- **Buyer's Guide:** User researching before purchase/hire
- **Problem/Solution:** User has specific issue, needs fix

**Secondary Intent (from context):**
- **Emotional:** What feeling drives their search?
- **Functional:** What practical outcome do they need?
- **Trust:** What proof will convince them?

**Hidden Intent (inferred):**
- Budget constraints
- Time pressure
- Quality concerns
- Previous bad experiences
- Desire for control/understanding

---

## Phase 2: SEO Optimization Framework

### 2.1 Three Distinct SEO Elements

**Understanding the Separation:**
1. **POST_TITLE** → Becomes the H1 in WordPress automatically (natural, readable)
2. **META_TITLE** → SEO title tag for search results (keyword-optimized, up to 120 chars)
3. **META_DESCRIPTION** → Search result snippet (155-160 chars with CTA)
4. **META_KEYWORDS** → Comma-separated keywords ordered by importance (max 25)

### 2.2 POST_TITLE Development (WordPress H1)

**Purpose:** This becomes the visible H1 on the page
**Characteristics:**
- Natural, conversational language
- Clear and compelling for readers
- Includes primary keyword naturally
- No character limit (but keep reasonable)
- Focus on user experience over SEO

**Examples:**
- "Choosing Between Clear Coat and Colored Epoxy for Your Garage Floor"
- "Special Considerations for Coating Your Detached Garage Floor"
- "How to Prevent UV Yellowing in Garage Floor Coatings"

### 2.3 META_TITLE Development (SEO Title Tag)

**Purpose:** What appears in search results
**Structure Formula:**
```
[Primary KW + Main Topic] | [Secondary KWs + Entities] | [Location + Brand]
```

**Characteristics:**
- Up to 120 characters
- Front-load primary keyword
- Include multiple keywords/entities
- Add location for local SEO
- Can be more keyword-dense than POST_TITLE

**Examples:**
- "Clear Coat vs Colored Epoxy Garage Floor | Windsor Coating Guide | Costs & Durability 2025"
- "Detached Garage Floor Coating | Special Prep & Costs | Windsor Ontario Experts"
- "UV Resistant Garage Floor Coating | Prevent Yellowing | Polyaspartic vs Epoxy Windsor"

### 2.4 META_DESCRIPTION Development (Click Optimization)

**Purpose:** Entice searchers to click - as important as the title for CTR

**Click Psychology Formula:**
```
[Hook/Intrigue (40 chars)] + [Specific Solution/Benefit (60 chars)] + [Urgency/Curiosity Gap (35 chars)] + [Clear CTA (20 chars)]
```

**Click Triggers to Use:**
- **Specificity**: "Learn the 3 signs that..." instead of "Learn about..."
- **Curiosity Gap**: "Most homeowners don't know..." or "The surprising reason..."
- **Urgency**: "Before winter arrives..." or "Limited availability..."
- **Social Proof**: "Join 500+ Windsor homeowners who..."
- **Contrast**: "Why cheap options cost more..." or "The hidden cost of..."
- **Questions**: "Is your garage floor secretly failing?"
- **Numbers**: "Save 30% on..." or "Lasts 20 years when..."

**Examples of Click-Worthy Meta Descriptions:**

Weak: "Learn about garage floor coating options. Professional installation available in Windsor. Contact us."

Strong: "Clear coat reveals concrete beauty, colored hides flaws - which saves you more? Windsor installers expose the $2,000 difference most miss. Free assessment."

Strong: "Warning: 70% of DIY epoxy fails within 2 years. Discover why professional installation costs less long-term. Windsor's data from 500+ garages proves it."

**Character Count:** Exactly 155-160 characters
- Front-load the hook
- Include primary keyword naturally
- End with action-oriented language

### 2.5 META_KEYWORDS Development (Semantic Coverage)

**Purpose:** Capture all important concepts, entities, and topics covered in the article

**Generation Strategy:**
1. **Primary keyword** (always first)
2. **Brand names** mentioned in content (Pentair, Hayward, MasterTemp, etc.)
3. **Technical terms** central to article (error codes, diagnostics, troubleshooting)
4. **Service/product names** (specific models, systems, processes)
5. **Location** (if local service article)
6. **Major concepts** covered (warranty service, factory training, etc.)
7. **Related terms** users might search (repair, replacement, maintenance)

**Formatting Rules:**
- Proper case for brands/products: "Pentair MasterTemp", "Hayward H-Series"
- Lowercase for generic terms: "pool heater repair", "error codes"
- Order by importance and relevance
- Maximum 25 keywords
- No duplicates
- Comma-separated

**Example for Pool Heater Troubleshooting Article:**
```
"meta_keywords": "Pentair pool heater repair, Hayward pool heater, Raypak error codes, MasterTemp troubleshooting, H-Series heater, Jandy JXi, pool heater diagnostics, factory trained technician, authorized dealer, warranty service, error code diagnosis, genuine parts, IntelliTouch, AquaRite, Max-E-Therm, Sta-Rite heater, pool heater not heating, heater control board, igniter replacement"
```

**Example for Garage Floor Coating Comparison:**
```
"meta_keywords": "clear coat garage floor, colored epoxy, garage floor coating, epoxy flooring Windsor, concrete coating comparison, UV resistant coating, polyaspartic topcoat, garage floor aesthetics, floor protection, concrete preservation, epoxy durability, garage floor maintenance, showroom finish, concrete stain coverage"
```

### 2.6 Example SEO Quartet for WordPress

**For Garage Floor Coating Comparison:**

**POST_TITLE (becomes H1):**
"Choosing Between Clear Coat and Colored Epoxy for Your Garage Floor"

**META_TITLE (SEO title tag - 112 chars):**
"Clear Coat vs Colored Epoxy Garage Floor: Complete Comparison Guide | Costs & Durability | Windsor Ontario"

**META_DESCRIPTION (159 chars):**
"Comparing clear coat vs colored epoxy for garage floors? See real costs, 20-year durability data, and which option hides flaws best. Free Windsor quotes."

**META_KEYWORDS:**
"clear coat garage floor, colored epoxy, garage floor coating, epoxy flooring Windsor, concrete coating comparison, UV resistant coating, polyaspartic topcoat, garage floor aesthetics, floor protection, concrete preservation"

**Output Format:**
```
POST_TITLE: Choosing Between Clear Coat and Colored Epoxy for Your Garage Floor
META_TITLE: Clear Coat vs Colored Epoxy Garage Floor: Complete Comparison Guide | Costs & Durability | Windsor Ontario
META_DESCRIPTION: Comparing clear coat vs colored epoxy for garage floors? See real costs, 20-year durability data, and which option hides flaws best. Free Windsor quotes.
META_KEYWORDS: clear coat garage floor, colored epoxy, garage floor coating, epoxy flooring Windsor, concrete coating comparison, UV resistant coating, polyaspartic topcoat, garage floor aesthetics, floor protection, concrete preservation
---
<p>CONCRETE SURFACES is Windsor's trusted garage floor coating specialist that helps homeowners choose between preservation and transformation...</p>
```

---

## Phase 3: Content Structure Framework

### 3.1 Universal Article Structure

**Output Format for WordPress:**
```
POST_TITLE: [Natural H1 that WordPress will use]
META_TITLE: [SEO-Optimized Title Tag - Up to 120 chars]
META_DESCRIPTION: [Meta Description - Exactly 155-160 chars]
META_KEYWORDS: [Comma-separated keywords ordered by importance, max 25]
---
[Opening paragraph with topic sentence that directly answers search intent]

<section id="quick-answer">
    <!-- CRITICAL: This section MUST immediately answer the search intent -->
    <!-- Reader must know they're in the right place within first 100 words -->
    <!-- If the query is "how to fix X", tell them if it's DIY or pro job -->
    <!-- If the query is "cost of X", give the range immediately -->
    <!-- If the query is "X vs Y", state the key difference upfront -->
    <p>[Direct answer paragraph with ONE link to service]</p>
    <p>[Elaborate with key information they're looking for]</p>
    <p>[Additional critical details that complete the initial answer]</p>
</section>

<!-- DYNAMIC SECTIONS BASED ON INTENT AND NICHE -->
<!-- Each section must add NEW information, never repeat -->
<!-- Order by what reader needs most urgently -->
<!-- Skip sections that don't serve the specific query -->

[Include only sections that serve the reader's intent]
[Order sections by priority for the specific query]
```

**Content Focus Rules:**

**MUST Include (Once Each):**
- Direct answer to search query (first 100 words)
- Specific details reader can use
- Clear DIY vs professional guidance
- Actual cost ranges with what affects them

**NEVER Repeat:**
- Safety warnings (one callout if truly needed)
- "Call a professional" (one clear section)
- Cost factors (explain once thoroughly)
- Maintenance advice (one specific checklist)
- Company credentials (brief mention in topic sentence + end)

**Skip Entirely If Not Essential:**
- Philosophy about why maintenance matters
- Generic benefits everyone knows
- Vague future problems warnings
- Company history unless directly relevant

**Section Selection Guide:**

**ALWAYS Include:**
- Quick answer (addresses search intent immediately)
- Professional solution (connects to service)

**CONDITIONALLY Include Based on Niche/Intent:**
- Local context (for location-dependent services like trades)
- Technical explanation (when understanding "why" matters)
- Cost/value analysis (when price is a primary concern)
- Process steps (for how-to queries)
- Detailed comparison (when evaluating options)
- Common mistakes (when failure risk is high)
- FAQs (when multiple related questions exist)

**RARELY Include for Certain Niches:**
- Local context section is typically NOT relevant for:
  - Medical procedures (Invisalign, treatments)
  - Vaccines or medications
  - Investment strategies
  - Online services
  - Universal topics without geographic variation

### 3.2 Dynamic Section Ordering by Intent Type

**Emergency Intent (Plumbing leak, AC failure, etc.):**
```
1. Quick Answer - What to do RIGHT NOW
2. Emergency solution - How to get immediate help
3. Problem explanation - Why this happened (brief)
4. Prevention tips - For next time
5. Professional solution - CTA
(FAQs optional at end)
```

**Research Intent (Planning renovations, comparing options):**
```
1. Quick Answer - Overview of options/process
2. Educational content - Deep understanding
3. Comparison/Analysis - Detailed evaluation
4. Cost/Value breakdown - Investment understanding
5. Local considerations (if applicable)
6. FAQs - Additional questions
7. Professional solution - CTA
```

**Transactional Intent (Ready to buy/hire):**
```
1. Quick Answer - What they get, cost range, timeline
2. Process overview - What to expect
3. Trust signals - Why choose this company
4. Professional solution - Strong CTA
(Minimal education - they already know)
```

**Problem/Solution Intent (Something is broken/wrong):**
```
1. Quick Answer - Is this the problem they have?
2. Solution options - Ranked by effectiveness
3. DIY vs Professional - When to call for help
4. Cost expectations - Investment ranges
5. Professional solution - CTA
```

**Comparison Intent (Evaluating alternatives):**
```
1. Quick Answer - Key differences stated upfront
2. Detailed comparison - Structured analysis
3. Decision framework - When to choose each
4. Cost/value analysis - ROI comparison
5. Professional solution - CTA
```

### 3.3 Section Inclusion Decision Matrix

**Quick Answer:** REQUIRED for all intent types
**Technical Details:** Brief for emergency, detailed for research/YMYL, minimal for transactional, moderate for problem/comparison
**Local Context:** Include if relevant (rarely for YMYL topics)
**Cost Analysis:** Brief for emergency, detailed for research, upfront for transactional, important for problem, critical for comparison, careful for YMYL
**Process Steps:** Emergency steps only for emergency intent, detailed for research, overview for transactional, solution steps for problem, per option for comparison, qualified for YMYL
**FAQs:** Optional for emergency, important for research/YMYL, minimal for transactional, helpful for problem/comparison
**Trust Signals:** Quick for emergency, built throughout for research, emphasized for transactional, important for problem, neutral for comparison, credentials for YMYL
**Professional CTA:** Urgent for emergency, soft for research, strong for transactional, clear for problem, neutral for comparison/YMYL

### 3.4 Opening Requirements

The article must begin with a topic sentence that establishes business identity and directly answers the search query. See paragraphs.md for topic sentence formulas and requirements.

### 3.5 Content Strategy by Section Type

**Principle:** Each section serves a specific purpose in the reader's journey. Consider what information the reader needs at each point and how they'll want to consume it.

#### Opening Section Strategy

**Purpose:** Establish credibility and immediately answer the search query

**Content Requirements:**
- Business identity and primary value proposition
- Direct answer to the search query
- Connection to the service offering (one link only)
- Critical context that confirms reader is in the right place

**Strategic Considerations:**
- Keep focused and scannable - this is where you keep or lose the reader
- Front-load the most important information
- Highlight urgent warnings if safety-critical

---

#### Comparison Section Strategy

**Purpose:** Help reader evaluate options against their specific needs

**Content Requirements:**
- Present options side-by-side across key differentiating attributes
- Include cost differences with specific factors that drive variation
- Show performance/durability differences with concrete timeframes
- Identify ideal use cases for each option
- Provide decision criteria based on reader's situation

**Strategic Considerations:**
- Reader needs to compare attributes easily
- Avoid forcing them to remember details from one option while reading about another
- Make the comparison scannable

---

#### Process/How-To Section Strategy

**Purpose:** Guide reader through sequential steps with confidence

**Content Requirements:**
- Present steps in chronological order with specific actions
- Include timing expectations (how long each step takes)
- Explain why each step matters (not just what to do)
- Highlight critical warnings or points where things commonly go wrong
- Provide context that helps reader understand the overall flow

**Strategic Considerations:**
- Reader needs to follow a sequence
- Important to distinguish between steps and explanatory context
- Critical safety or timing information should stand out

---

#### Problem Explanation Section Strategy

**Purpose:** Help reader understand what's happening and why it matters

**Content Requirements:**
- Clear explanation of the problem mechanism
- Connection between technical details and reader outcomes
- Identification of symptoms or indicators
- Explanation of why this matters to the reader specifically
- Context about timing, severity, or progression

**Strategic Considerations:**
- Balance technical accuracy with accessibility
- Connect abstract concepts to concrete reader impacts
- Help reader self-diagnose if applicable
- Make red flags unmissable

---

#### Solutions Section Strategy

**Purpose:** Present actionable options ranked by effectiveness

**Content Requirements:**
- Multiple solution options ordered by effectiveness or cost
- Clear guidance on when to choose each option
- Specific steps or requirements for each solution
- Cost expectations and ROI considerations
- DIY vs professional assessment where relevant

**Strategic Considerations:**
- Reader may be looking for quick wins vs long-term solutions
- Some solutions may be interim while waiting for professional help
- Rankings help reader make quick decisions
- Insider tips that save money/time should be emphasized

---

#### Cost/Value Section Strategy

**Purpose:** Set realistic expectations and justify investment

**Content Requirements:**
- Specific price ranges (not vague "affordable" claims)
- Factors that drive cost variation
- ROI timeline or savings projections
- Comparison of short-term vs long-term costs
- What's included vs what costs extra

**Strategic Considerations:**
- Transparency builds trust
- Reader needs to understand what affects their specific price
- Avoid surprises - address common cost misconceptions
- Money-saving opportunities should be emphasized

---

#### FAQ Section Strategy

**Purpose:** Address related questions that didn't fit naturally in flow

**Content Requirements:**
- Questions that represent common follow-up queries
- Direct, concise answers
- Strategic use to target "People Also Ask" opportunities
- Placement at end so doesn't interrupt main narrative

**Strategic Considerations:**
- Include only when you have multiple distinct questions
- Each answer should be self-contained
- Avoid repeating content from earlier sections

---

#### Professional Solution/CTA Section Strategy

**Purpose:** Bridge from education to action

**Content Requirements:**
- Brief recap of key decision factors
- Business differentiators (specific, not vague claims)
- Clear next steps with timeline expectations
- Contact information or response time guarantees
- Credentials that specifically relate to the service discussed

**Strategic Considerations:**
- Reader has finished learning and needs direction
- Make the action path crystal clear
- Reinforce why they should choose your company specifically
- Special offers or urgency factors should be prominent

### 3.6 Content Strategy Examples

These examples show strategic differences in content approach, not formatting preferences.

#### Example 1: Technical Explanation

**Weak Content Strategy:**
- Lists symptoms without connection
- No explanation of mechanism
- Missing practical implications for reader

Approach: "UV radiation breaks down polymers. Chemical structure changes. Color shifts to yellow."

**Strong Content Strategy:**
- Explains mechanism and why it matters
- Connects technical details to reader outcomes
- Provides actionable timing information

Approach: "UV radiation triggers a chemical reaction in standard epoxy that breaks down the polymer structure at a molecular level. This degradation doesn't just affect appearance – it makes the coating brittle and prone to peeling, especially near windows where sun exposure is highest. Yellowing typically starts within 6-12 months in areas with direct sunlight and accelerates in garages with south-facing windows."

**Why This Works:**
- Reader understands both what happens and why they should care
- Specific timeframes help reader assess their own situation
- Practical information about location (south-facing windows) enables action

---

#### Example 2: Comparison Content

**Weak Content Strategy:**
- Merges comparison into dense paragraphs
- Reader must remember Option A details while reading Option B
- Hard to identify key differences quickly

Approach: "Clear coat costs moderate to premium prices and works best for new concrete. It shows dust more easily but preserves the natural look. Colored epoxy also costs moderate to premium prices and works best for older concrete. It hides dirt better and covers imperfections."

**Strong Content Strategy:**
- Presents options so reader can easily compare attributes
- Focuses on decision criteria rather than just features
- Organized by reader's decision process (when to choose each)

Approach: Present when to choose clear coat (concrete has character worth preserving, minimalist aesthetic preferred, good lighting) vs when to choose colored epoxy (stains to conceal, uniform look desired, hides minor dirt). Reader can quickly identify which scenario matches their situation.

**Why This Works:**
- Reader can immediately identify which option fits their situation
- Organized by reader's decision needs, not product features
- Enables quick scanning to find relevant scenario

---

#### Example 3: Process Content

**Weak Content Strategy:**
- Vague sequence without actionable details
- Missing timing and context
- No explanation of why steps matter

Approach: "First, clear everything out of the garage. Then check for moisture issues. Next, ensure proper temperature. Finally, apply the coating."

**Strong Content Strategy:**
- Specific actions with timing expectations
- Explains why each step matters
- Provides context unique to the situation
- Highlights practical considerations

Approach: Complete clearing (Day 1-2) with context about why detached garages accumulate more items. Moisture testing (Day 2) with specific threshold (below 3 lbs per 1,000 sq ft) and explanation of why detached garages have higher moisture. Temperature management (Day 3-5) with specific range (50-90°F) and practical solution (portable heaters). Each step includes timing, specific requirements, and situational context. Tip about scheduling between May-September to avoid heating costs.

**Why This Works:**
- Reader knows exactly what to do and when
- Specific requirements (moisture thresholds, temperature ranges) enable proper execution
- Context explains why this situation differs from standard cases
- Timing helps reader plan schedule and budget

### 3.7 Archetype-Specific Content Strategies

These templates describe WHAT content to include and WHY, not HOW to format it.

#### COMPARISON Archetype

**Content Strategy:**
Readers comparing options need to quickly identify which choice fits their situation.

**Required Sections:**

**1. Comparison Overview**
- Introduce both options with high-level distinction
- Explain when each option is typically used
- Set context for the detailed comparison

**2. Detailed Analysis**
- Compare options across key differentiating attributes:
  - Cost ranges and what drives variation
  - Durability/lifespan with specific timeframes
  - Performance characteristics that matter to reader
  - Maintenance requirements and effort
  - Best use cases for each option
- Present attributes in parallel for easy comparison
- Include specific numbers, not vague descriptors

**3. Decision Framework**
- Organize by reader scenarios, not product features
- "Choose Option A if: [specific situations]"
- "Choose Option B if: [different situations]"
- Help reader quickly identify which matches their needs

**Strategic Priorities:**
- Make comparison scannable - reader shouldn't have to hold Option A details in memory while reading Option B
- Focus on decision criteria that actually differentiate the options
- Use specific scenarios reader can pattern-match to their situation

---

#### HOW-TO Archetype

**Content Strategy:**
Readers want to accomplish a task and need confidence they can execute correctly.

**Required Sections:**

**1. Process Overview**
- Explain what the complete process involves
- Provide realistic timeline expectations
- List what reader needs before starting
- Set expectations for difficulty level

**2. Sequential Steps**
- Present steps in chronological execution order
- For each step include:
  - Specific action to take
  - Timing (how long this step takes)
  - Why this step matters
  - Common mistakes at this stage
- Number steps clearly if order matters
- Distinguish between the step itself and supporting context

**3. Trouble Prevention**
- Identify points where things commonly go wrong
- Explain how to recognize problems early
- Provide corrective actions if things don't go as planned

**Strategic Priorities:**
- Reader needs confidence they can execute correctly
- Critical warnings or safety issues must be unmissable
- Balance detail with accessibility (too much = overwhelming, too little = failures)
- Help reader self-assess if they should DIY or call professional

---

#### TECHNICAL DEEP-DIVE Archetype

**Content Strategy:**
Reader has a problem and needs to understand what's happening and how to fix it.

**Required Sections:**

**1. Problem Identification**
- Clear explanation of what the problem is
- Symptoms or indicators reader can verify
- Why this matters (consequences of ignoring)
- Common misconceptions to address

**2. Cause Explanation**
- Explain mechanism in accessible terms
- Connect technical details to reader outcomes
- Provide context about why this happens
- Address contributing factors

**3. Solution Options (Ranked)**
- Present solutions ordered by effectiveness
- For each solution:
  - What it addresses
  - Effectiveness level
  - Cost expectations
  - When to use this approach
  - Limitations or considerations
- Clear guidance on DIY vs professional

**Strategic Priorities:**
- Balance technical accuracy with accessibility
- Focus on information reader can actually use
- Help reader diagnose their specific situation
- Clear guidance on when professional help is needed
- Avoid technical tangents that don't serve reader's goal

---

#### BUYER'S GUIDE Archetype

**Content Strategy:**
Reader is researching before making purchase/hiring decision.

**Required Sections:**

**1. Selection Criteria**
- Key factors that should drive decision
- How to evaluate options against criteria
- Red flags or warning signs to avoid
- Must-have vs nice-to-have features

**2. Cost Considerations**
- Price range expectations
- What affects cost in this category
- Long-term cost of ownership
- ROI considerations

**3. Provider Evaluation**
- How to assess company qualifications
- Questions to ask during consultation
- Credentials that actually matter
- Warning signs of unqualified providers

**Strategic Priorities:**
- Arm reader with information to make confident decision
- Help reader avoid common mistakes or scams
- Establish what "good" looks like in this category
- Position your company naturally as meeting these criteria

---

#### PROBLEM/SOLUTION Archetype

**Content Strategy:**
Reader has immediate problem and needs to know what to do right now.

**Required Sections:**

**1. Problem Confirmation**
- Help reader confirm this is actually their problem
- Distinguish from similar issues
- Assess severity/urgency
- Immediate safety considerations if applicable

**2. Solution Path**
- Immediate actions to take
- What reader can safely do themselves
- When to call professional immediately
- Temporary measures vs permanent fixes

**3. Resolution Expectations**
- Timeline for professional resolution
- Cost expectations
- What the fix involves
- How to prevent recurrence

**Strategic Priorities:**
- Address urgency - reader may be stressed or in emergency
- Clear, actionable immediate steps
- Obvious path to professional help
- Realistic timeline and cost expectations
- Help reader feel situation is under control

---

## Phase 4: Industry-Specific Atomic Facts Framework

### 4.1 Universal Fact Categories

Every industry article should include 5-7 atomic facts from these categories:

```
TECHNICAL SPECIFICATIONS:
- Industry standards and benchmarks
- Measurements, ratings, or certifications
- Performance metrics or success rates
- Lifespan or durability expectations
- Compliance requirements or codes

COST & VALUE:
- Specific price ranges (not just "affordable")
- What drives cost variation
- ROI timelines or savings projections
- Warranty terms and coverage
- Maintenance cost expectations

PROCESS & TIMELINE:
- Duration for service/installation
- Steps in the process
- Weather or seasonal constraints
- Cure times or waiting periods
- Inspection or follow-up schedules

PROBLEM INDICATORS:
- Specific symptoms to watch for
- Testing methods or diagnostic tools
- When DIY is appropriate vs professional
- Safety thresholds or red flags
- Failure patterns or common issues

LOCAL/REGIONAL:
- Climate impacts on service/product
- Local regulations or permit requirements
- Regional pricing variations
- Seasonal service demand
- Area-specific considerations

CREDENTIALS & TRUST:
- Certifications required for work
- Insurance minimums
- Licensing requirements
- Industry association standards
- Manufacturer authorization benefits
```

### 4.2 Atomic Fact Integration

**Principle:** Weave facts into natural prose, never list them mechanically

**Poor Integration:**
```
Here are some facts about epoxy:
- Lasts 15-20 years
- Costs $3-8 per square foot
- Cures in 24 hours
```

**Strong Integration:**
```
Professional-grade epoxy floors last 15-20 years when properly installed, making the $3-8 per square foot investment more cost-effective than cheaper coatings that need replacement every 3-5 years. While the coating cures enough for foot traffic in 24 hours, you'll want to wait 72 hours before parking vehicles to ensure full bond strength.
```

### 4.3 Fact Sourcing by Industry

**Home Services (Plumbing, HVAC, Electrical):**
- Manufacturer specifications
- Local building codes
- Industry association standards (PHCC, ACCA, NECA)
- Warranty terms
- Emergency response times

**Flooring/Coating Services:**
- Product specifications (cure time, coverage rates, lifespan)
- Preparation requirements
- Climate/temperature constraints
- Cost per square foot ranges
- Warranty coverage

**Health Services (YMYL):**
- Professional organization guidelines
- Treatment success rates (from studies)
- Timeline expectations
- Consultation requirements
- Insurance coverage considerations

**Technical Services:**
- System specifications
- Performance benchmarks
- Compatibility requirements
- Security standards
- Update frequencies

---

## Phase 5: Voice & Positioning Calibration

### 5.1 Voice Spectrum by Industry

**Urgent/Emergency (Plumbing leak, HVAC failure):**
- Direct, action-oriented
- Minimal philosophy or background
- Clear next steps emphasized
- Professional availability highlighted

**Educational/Research (Major investments, comparisons):**
- Thorough but accessible
- Technical depth appropriate to audience
- Multiple considerations presented
- Decision framework provided

**Professional/Conservative (Legal, Medical, Financial - YMYL):**
- Qualified language throughout
- Multiple caveats and considerations
- Emphasis on consultation
- Conservative tone

**Confident/Authoritative (Non-YMYL services):**
- Expertise demonstrated through specifics
- Strong positioning statements
- Guarantees and credentials prominent
- Local authority emphasized

### 5.2 Business Positioning Integration

**Credential Distribution Strategy:**
- Topic sentence: Years in business or main specialization
- Opening section: 1-2 major credentials naturally woven
- Throughout: Credentials relevant to specific sections
- Closing: Unique differentiators and guarantees
- Never dump all credentials in one paragraph

**Examples of Natural Integration:**

**Topic Sentence:**
"CONCRETE SURFACES is Windsor's premier epoxy flooring specialist that transforms garage floors with lasting protection and stunning aesthetics."
[Establishes: business name, location, specialty, benefit]

**Technical Section:**
"As certified Polyaspartic installers, we use commercial-grade topcoats that cure in 24 hours instead of the 72-hour cure time of standard epoxy."
[Weaves: certification, specific expertise, concrete benefit]

**Process Section:**
"Through 500+ residential installations since 2015, we've refined our moisture testing protocol to prevent the adhesion failures that plague rushed jobs."
[Weaves: experience quantity, years, specific expertise]

**Trust Section:**
"Our 4.9-star rating from 187 Google reviews reflects consistent execution, and our lifetime warranty on materials plus 5-year installation warranty demonstrates confidence in our work."
[Weaves: social proof, warranty terms, quality commitment]

### 5.3 Opening Paragraph Strategy

**Formula:**
1. Topic sentence (business identity + search query answer)
2. Expand on main point with key benefit/consideration
3. Connect to service with ONE link

**Example:**
```html
<p>CONCRETE SURFACES is Windsor's premier epoxy flooring specialist that transforms garage floors with lasting protection and stunning aesthetics. The decision between clear coat and colored epoxy affects not just how your garage looks, but how it performs over the next 15-20 years. Through our <a href="[SERVICE_URL]">professional epoxy flooring services</a>, we've helped hundreds of Windsor homeowners make this choice based on their concrete's condition, design preferences, and long-term goals.</p>
```

### 5.4 Closing Section Strategy

**Elements to Include:**
- Brief recap of main decision factors
- Business differentiators (what makes you different)
- Clear call-to-action with next steps
- Contact information or response time

**Example:**
```html
<section id="professional-solution">
    <h2>Professional Epoxy Installation in Windsor</h2>
    <p>Choosing between clear coat and colored epoxy comes down to your concrete's condition and aesthetic preferences. Clear coat showcases beautiful concrete, while colored epoxy provides uniform coverage and hides imperfections.</p>
    
    <p>CONCRETE SURFACES has installed over 500 garage floors in Windsor since 2015, using commercial-grade polyaspartic topcoats that resist UV yellowing and cure in 24 hours. As the only certified ArmorGarage installer in Windsor, we provide genuine materials with lifetime warranty coverage plus 5-year installation warranty.</p>
    
    <p>Schedule your free assessment to see examples of both clear coat and colored epoxy in real Windsor garages, and get a detailed quote based on your concrete's condition. We provide same-day estimates and complete most installations within 5 days.</p>
</section>
```

---

## Phase 6: HTML Structure & Semantic Markup

### 6.1 WordPress-Specific Requirements

**Critical Rules:**
- POST_TITLE becomes the H1 automatically in WordPress
- NEVER include `<h1>` tags in post_content
- Content begins immediately with opening paragraph
- Use semantic HTML5 elements (`<section>`, `<article>`)
- Maintain proper heading hierarchy (H2 → H3 → H4)

**Example Output Structure:**
```json
{
  "post_title": "Choosing Between Clear Coat and Colored Epoxy for Your Garage Floor",
  "meta_title": "Clear Coat vs Colored Epoxy Garage Floor | Windsor Guide",
  "meta_description": "Comparing clear coat and colored epoxy...",
  "meta_keywords": "clear coat garage floor, colored epoxy, garage floor coating...",
  "post_content": "<p>CONCRETE SURFACES is Windsor's trusted garage floor coating specialist...</p>\n\n<section id=\"quick-answer\">\n<h2>Understanding Clear Coat vs Colored Epoxy</h2>\n<p>...</p>\n</section>"
}
```

### 6.1.5 Section Element Requirements (CRITICAL)

**Mandatory Section Structure:**
Every article MUST use semantic `<section>` elements to wrap logical content blocks. This provides proper HTML5 structure, enables accessibility, supports anchor linking, and improves SEO.

**Section Creation Rules:**
1. **Opening content** (all paragraphs before first H2): Always wrap in `<section id="introduction" class="[section-class]">`
   - Even single paragraph introductions must be wrapped
   - Include the topic sentence and any initial context
2. **Each H2 and its content**: Wrap in separate `<section>` element with unique ID
   - H3 subsections stay within their parent H2's section (no nested sections)
   - Section ends when the next H2 begins or article concludes
3. **ID naming**: Kebab-case derived from H2 text, removing filler words but keeping core meaning
   - Example: "Why Annual Maintenance Matters for DFW Pool Heaters" → `id="why-annual-maintenance-matters"`
   - Example: "Monthly Homeowner Maintenance Tasks" → `id="monthly-homeowner-maintenance-tasks"`
4. **Class attribute**: Get from business background file under "Blog Settings" → "section_class"
   - Example: Executive Blue Pools has `section_class: ebp-section`
   - Use this value in every section: `<section class="ebp-section" id="...">`

**❌ WRONG - Single Section Wrapper:**
```html
<!-- DO NOT DO THIS -->
<section class="ebp-section">
  <p>Executive Blue Pools is Collin County's factory-trained pool heater specialist...</p>
  <p>Pool heaters operating in North Texas face unique challenges...</p>

  <h2>Monthly Homeowner Maintenance Tasks</h2>
  <p>Between professional service visits...</p>
  <ol>...</ol>

  <h2>Annual Professional Service Checklist</h2>
  <p>Professional maintenance should occur each spring...</p>
  <h3>Combustion System Inspection</h3>
  <p>Technicians test igniter resistance...</p>
  <h3>Heat Exchanger Evaluation</h3>
  <p>Visual inspection through the combustion chamber...</p>

  <h2>Cost Comparison</h2>
  <p>Annual preventive maintenance costs...</p>
</section>
```
**Problem:** Entire article wrapped in one section = no semantic structure, poor accessibility, no anchor targets

**✅ CORRECT - Multiple Section Elements:**
```html
<!-- DO THIS -->
<section class="ebp-section" id="introduction">
  <p>Executive Blue Pools is Collin County's factory-trained pool heater specialist...</p>
  <p>Pool heaters operating in North Texas face unique challenges...</p>
  <p>Professional pool heater maintenance combines monthly homeowner inspections...</p>
</section>

<section class="ebp-section" id="monthly-homeowner-maintenance-tasks">
  <h2>Monthly Homeowner Maintenance Tasks</h2>
  <p>Between professional service visits, homeowners should perform visual and acoustic inspections...</p>
  <ol>
    <li><strong>Visual leak inspection:</strong> Check around pump, filter, heater...</li>
    <li><strong>Filter pressure monitoring:</strong> Verify pressure gauge reads...</li>
  </ol>
  <p>Document these inspections with photos and dates...</p>
</section>

<section class="ebp-section" id="annual-professional-service">
  <h2>Annual Professional Service Checklist</h2>
  <p>Professional maintenance should occur each spring before heavy pool season begins...</p>

  <h3>Combustion System Inspection</h3>
  <p>Technicians test igniter resistance using a multimeter...</p>
  <p>The flame sensor gets cleaned with fine sandpaper...</p>

  <h3>Heat Exchanger Evaluation</h3>
  <p>Visual inspection through the combustion chamber reveals calcium scale buildup...</p>
  <p>For copper exchangers in salt pools, technicians check for green corrosion...</p>
</section>

<section class="ebp-section" id="cost-comparison">
  <h2>Maintenance Cost vs Emergency Repair Comparison</h2>
  <p>Annual preventive maintenance costs $150-300 depending on services required...</p>
  <h3>Typical Maintenance Costs</h3>
  <ul>...</ul>
  <h3>Emergency Repair Costs</h3>
  <ul>...</ul>
</section>
```
**Benefits:** Proper semantic HTML, each logical topic isolated, anchor link support, accessibility compliance, SEO structure

**Common Questions:**

**Q: Do H3 subsections get their own section elements?**
A: No. H3 headings and their content stay within the parent H2's section element. Sections are created only at H2 boundaries.

**Q: What if the introduction is just one paragraph?**
A: Still wrap it in `<section id="introduction">`. Always use introduction section regardless of length.

**Q: Where do I find the section class name?**
A: Check the business background file for a "Blog Settings" section with "section_class" value. If not specified, use "content-section" as default.

**Q: Can I simplify long H2 text for the ID?**
A: Yes. Remove filler words and location modifiers while keeping the core meaning. "Why Annual Maintenance Matters for DFW Pool Heaters" becomes `id="why-annual-maintenance-matters"`.

### 6.2 Section ID Naming Convention

Use kebab-case for section IDs that match content:
- `id="quick-answer"` - Opening direct answer section
- `id="comparison-overview"` - High-level comparison
- `id="detailed-comparison"` - Deep-dive comparison
- `id="cost-analysis"` - Cost breakdown section
- `id="diy-vs-professional"` - DIY assessment section
- `id="local-considerations"` - Regional factors
- `id="faq"` - Frequently asked questions
- `id="professional-solution"` - Final CTA section

### 6.3 Structural Guidelines

1. **Headers:** H2 marks new logical sections, not word counts
   - Use H2 when transitioning to new concept/topic
   - Section may be 200 words or 500 words as needed
   - If section feels too long, break into logical subsections with H3
   - Never add H2 just to meet arbitrary spacing
2. **Emphasis:** Use sparingly, never for keywords
3. **Callouts:** Use single class, vary the label (Pro Tip, Warning, etc.)

### 6.4 Real Structure Example

```html
<section class="content-section" id="introduction">
  <p>CONCRETE SURFACES is Windsor's trusted garage floor coating specialist that helps homeowners choose between preservation and transformation for lasting floor protection. The decision between clear coat and colored epoxy affects not just how your garage looks, but how it performs over the next 15-20 years. Through our <a href="[SERVICE_URL]">professional epoxy flooring services</a>, we've helped hundreds of Windsor homeowners make this choice based on their concrete's condition, design preferences, and long-term goals.</p>

  <p>Clear coat epoxy preserves and enhances your concrete's natural character, creating a glossy, showroom-quality finish that many homeowners love for its sophisticated appearance. This option works best when your concrete is in excellent condition without significant staining, cracks, or patches that need concealing.</p>
</section>

<section class="content-section" id="comparison-overview">
<h2>Understanding Your Options: Clear Coat and Colored Epoxy</h2>
<p>Both clear coat and colored epoxy create durable, protective surfaces that resist hot tire pickup, chemical spills, and abrasion from vehicle traffic. The fundamental difference lies in what you want to see: your concrete's natural character or a uniform color that hides imperfections.</p>

<h3>Clear Coat Characteristics</h3>
<ul>
    <li><strong>Appearance:</strong> Glossy finish that enhances concrete's natural color and texture</li>
    <li><strong>Coverage:</strong> Transparent coating shows underlying concrete including any stains or repairs</li>
    <li><strong>Durability:</strong> 15-20 years with proper maintenance and polyaspartic topcoat</li>
    <li><strong>Maintenance:</strong> Shows dust and tire marks more readily, requires regular sweeping</li>
    <li><strong>Best For:</strong> New concrete or concrete with character worth preserving</li>
</ul>

<h3>Colored Epoxy Characteristics</h3>
<ul>
    <li><strong>Appearance:</strong> Uniform color with optional decorative flakes or metallic effects</li>
    <li><strong>Coverage:</strong> Opaque coating conceals stains, patches, and concrete variations</li>
    <li><strong>Durability:</strong> 15-20 years with color-stable pigments and UV-resistant topcoat</li>
    <li><strong>Maintenance:</strong> Hides minor dirt between cleanings, forgiving appearance</li>
    <li><strong>Best For:</strong> Older concrete or when uniform color is desired</li>
</ul>
</section>

<section class="content-section" id="cost-comparison">
<h2>Cost Comparison: Clear Coat vs Colored Epoxy</h2>
<p>Both options fall in the moderate-to-premium price range, with final costs depending on your garage size, concrete condition, and desired finish quality. The price difference between clear coat and colored epoxy is minimal—usually $0.50-$1.00 per square foot—making the decision more about aesthetics than budget.</p>

<!-- Continue with detailed cost breakdown -->
</section>
```

---

## Phase 7: Writing Process Workflow

### 7.1 Pre-Writing Checklist

- [ ] Extract all brief elements
- [ ] Classify as YMYL or non-YMYL
- [ ] Identify archetype and select template
- [ ] List 5-7 atomic facts to include
- [ ] Determine appropriate voice/tone
- [ ] Map emotional → functional → trust journey

### 7.2 SEO Development Process

1. **Create POST_TITLE** (natural H1)
   - Conversational and clear
   - Includes primary keyword naturally
   - Compelling for readers

2. **Create META_TITLE** (up to 120 chars)
   - Primary keyword in first 60 characters
   - Secondary keywords and entities after
   - Location and brand if space allows

3. **Write META_DESCRIPTION** (155-160 chars)
   - Expand on title promise
   - Include specific benefit or proof
   - End with soft CTA

4. **Generate META_KEYWORDS** (max 25)
   - Primary keyword first
   - Brand names and technical terms
   - Major concepts covered
   - Ordered by importance

### 7.3 Content Creation Process

1. **Quick Answer Section**
   - Answer main question immediately
   - Acknowledge emotional context
   - Include credibility appropriate to industry
   - 200-300 words maximum

2. **Core Content Sections**
   - Follow archetype template
   - Include 1-2 atomic facts per section
   - Use appropriate HTML elements per loaded guides
   - Connect to reader's situation

3. **Local Context Section** (if applicable)
   - Regional considerations
   - Local examples or case studies
   - Climate/regulation impacts
   - Market conditions

4. **FAQ Section** (if appropriate)
   - Follow faqs.md for structure
   - Target "People Also Ask" opportunities

5. **Professional Solution Section**
   - Bridge from education to service
   - Include trust signals
   - Clear value proposition
   - Strong but appropriate CTA

### 7.4 Internal Linking Strategy

**CRITICAL LINKING RULES:**
- **ONE LINK ONLY** in the first 2-3 paragraphs to the main service page
- Link must be semantically relevant to the context
- Use natural, varied anchor text (not exact match keywords)
- NO OTHER LINKS throughout the entire article
- Service page URL must be provided as input to the writer

**Example Implementation:**
```html
<p>CONCRETE SURFACES is Windsor's premier epoxy flooring specialist that transforms garage floors with lasting protection and stunning aesthetics. When deciding between clear coat and colored epoxy for your garage floor, you're making a choice that affects both appearance and functionality for the next 20+ years. Our <a href="[SERVICE_PAGE_URL]">professional garage floor coating services</a> help Windsor homeowners make this important decision with confidence, backed by hundreds of successful installations.</p>

<p>[Continue with content - NO MORE LINKS after this point]</p>
```

**Anchor Text Best Practices:**
- Natural phrases: "professional garage floor coating services"
- Contextual: "expert installation process"
- Benefit-focused: "lasting floor protection solutions"
- Avoid: Exact match keywords or "click here"

---

## Phase 8: Quality Assurance

### 8.1 Content Quality Checklist

**Information Delivery:**
- [ ] Main question answered in first 300 words
- [ ] All three context layers addressed (emotional/functional/trust)
- [ ] 5-7 atomic facts integrated naturally
- [ ] Appropriate voice for industry/YMYL status
- [ ] Clear next steps provided
- [ ] Technical details only if reader can act on them
- [ ] Could any section be cut without losing value?

**Anti-Repetition Checks:**
- [ ] Safety warnings appear only once (if at all)
- [ ] "Call a professional" mentioned maximum twice
- [ ] Each section adds NEW information
- [ ] Cost information consolidated in one place
- [ ] No restatement of same point in different words
- [ ] Component sections each have unique focus

**Specificity Requirements:**
- [ ] Every claim backed by specific detail or number
- [ ] Maintenance = frequency + exact method
- [ ] Costs = specific ranges + what drives variation
- [ ] No vague phrases like "various factors" or "regular maintenance"
- [ ] Professional benefits name actual tools/expertise

**Structure and Format:**
- [ ] Output starts with POST_TITLE, META_TITLE, META_DESCRIPTION, META_KEYWORDS, then ---
- [ ] NO H1 tag in HTML content (WordPress creates from POST_TITLE)
- [ ] Content starts with topic sentence paragraph
- [ ] **Introduction section wraps all content before first H2** (even single paragraph)
- [ ] **Each H2 and its content wrapped in separate <section> element**
- [ ] **All sections have unique ID attributes in kebab-case**
- [ ] **All sections include class attribute from business background file** (e.g., class="ebp-section")
- [ ] **NO single section wrapping entire article** - must have multiple sections
- [ ] H3 subsections stay within parent H2's section (no nested sections)
- [ ] Proper HTML hierarchy (H2 → H3)
- [ ] H4 avoided unless absolutely necessary
- [ ] Sections follow archetype template
- [ ] Single callout class used consistently
- [ ] Mobile-friendly formatting

**Linking Requirements:**
- [ ] EXACTLY ONE internal link in first 2-3 paragraphs
- [ ] Link goes to main service page (URL provided as input)
- [ ] Anchor text is natural and contextually relevant
- [ ] NO other links anywhere in the article

### 8.2 SEO Quality Checklist

**Technical SEO:**
- [ ] POST_TITLE optimized for readability
- [ ] META_TITLE optimized (up to 120 chars)
- [ ] POST_TITLE and META_TITLE are different but aligned
- [ ] META_DESCRIPTION exactly 155-160 chars
- [ ] META_KEYWORDS includes 10-25 terms ordered by importance
- [ ] Primary keyword in first 100 words

**Content SEO:**
- [ ] Answer search intent completely (no artificial word count)
- [ ] 500 words for simple topics is perfect if complete
- [ ] 3,000 words for complex topics is fine if needed
- [ ] Semantically tight - every sentence serves a purpose
- [ ] Natural keyword density (1-2%)
- [ ] LSI/semantic terms included
- [ ] Local modifiers 2-3 times (if relevant)
- [ ] Entity coverage comprehensive

### 8.3 User Experience Checklist

**Readability:**
- [ ] Grade 8-10 reading level
- [ ] Scannable with clear headers
- [ ] Important points in bold (sparingly)
- [ ] White space adequate
- [ ] Logical flow maintained
- [ ] **NO em-dashes (—) anywhere in content**
- [ ] **Oxford commas in all lists**
- [ ] **Contractions used for conversational tone** (it's, you'll, don't)
- [ ] **Numerals used for all numbers** (3-4 years, not three to four years)

**Engagement:**
- [ ] Emotional drivers addressed
- [ ] Practical needs met
- [ ] Trust built appropriately
- [ ] Multiple engagement paths
- [ ] Clear value delivered

---

## Phase 9: Industry-Specific Adaptations

### 9.1 Avoiding Repetition Across Sections

**Single-Statement Rule:**
Each key message should appear ONCE in the article:
- Safety warnings: ONE callout box at the beginning if needed
- Professional recommendations: ONE section explaining when to call
- Cost factors: ONE consolidated explanation
- Maintenance tips: ONE checklist at the end

**Repetition Audit Questions:**
1. Have I already said this in different words?
2. Does each section add NEW information?
3. Could I combine similar points into one location?
4. Am I repeating safety/professional/cost messages?

**Example of Consolidation:**
Instead of mentioning "call a professional" in every section:
```html
<div class="callout">
<strong>DIY vs Professional:</strong> You can diagnose most problems yourself. 
Call a professional if you see error codes, smell gas, or need parts replacement.
</div>
```
Then each section only covers what's unique to that component.

### 9.2 Search Intent Priority Structure

**Answer These Questions in Order:**
1. **Identification (First 100 words):** What's broken and how do I know?
2. **Function (Brief):** What does this part do?
3. **DIY Assessment:** Can I fix this myself or do I need a pro?
4. **Cost Expectation:** Specific ranges for parts and labor
5. **Action Steps:** Exactly what to do next

**Skip or Minimize:**
- Generic safety warnings (unless truly dangerous)
- Vague maintenance advice
- Company credentials (save for end)
- Philosophical explanations of why maintenance matters

### 9.3 Specificity Requirements

**Replace Vague Statements:**

❌ **Vague:** "Various factors affect repair costs"
✓ **Specific:** "Costs vary by brand (Hayward 20% less than Pentair) and warranty status"

❌ **Vague:** "Regular maintenance prevents problems"
✓ **Specific:** "Clean flame sensor monthly with steel wool, test igniter resistance annually"

❌ **Vague:** "Professional diagnosis ensures proper repairs"
✓ **Specific:** "Technicians test with multimeters and manometers you likely don't own"

**Specificity Checklist:**
- [ ] Every claim has a number, example, or specific detail
- [ ] Maintenance advice includes frequency and method
- [ ] Cost ranges include what drives the variation
- [ ] Professional benefits name actual tools or expertise

### 9.4 Component-Based Content Strategy

For technical articles about parts/components:

**Each Component Section Must Be Different:**
- **Part A:** Focus on visual diagnosis
- **Part B:** Focus on testing procedures  
- **Part C:** Focus on error codes
- Don't repeat the same structure for each

**Unique Angle Examples:**
- Igniter: "Look for cracks in the ceramic"
- Control board: "Listen for clicking sounds during startup"
- Gas valve: "Check for error codes first"
- Pressure switch: "Test with manometer for exact readings"

### 9.5 Emergency vs Educational Balance

**Emergency Content (Furnace won't start, water heater leaking):**
- Lead with immediate action steps
- Minimize background/history
- Safety warnings up front if needed
- Clear professional contact path
- Target length: 800-1,200 words

**Educational Content (Comparing systems, planning upgrades):**
- Thorough explanation welcomed
- Multiple considerations explored
- Decision framework provided
- Target length: 1,500-2,500 words

**Technical Content (Understanding error codes, diagnosing problems):**
- Balance depth with accessibility
- Specific diagnostic steps
- Clear DIY vs professional line
- Target length: 1,200-2,000 words

---

## Phase 10: Brand-Specific Adaptations

### 10.1 Multi-Brand Technical Content

For articles covering multiple brands (e.g., Pentair, Hayward, Raypak pool heaters):

**Organization Strategy:**
1. **Opening:** Address all brands collectively
2. **Common Issues Section:** Problems shared across brands
3. **Brand-Specific Sections:** Unique to each manufacturer
4. **Selection Framework:** When to call brand-authorized service

**Example Structure:**
```html
<section id="common-issues">
<h2>Common Problems Across All Pool Heater Brands</h2>
<p>Whether you have Pentair, Hayward, Raypak, or Jandy equipment, certain issues affect all pool heaters regardless of manufacturer...</p>
</section>

<section id="pentair-specific">
<h2>Pentair MasterTemp & IntelliTouch Troubleshooting</h2>
<h3>Pentair Error Codes</h3>
<ul>
    <li><strong>IF (Ignition Failure):</strong> Check gas supply, test igniter resistance, inspect flame sensor</li>
    <li><strong>LS (Low Switch):</strong> Verify water flow, check pressure switch, clean filter</li>
</ul>
</section>

<section id="hayward-specific">
<h2>Hayward H-Series & AquaRite Diagnostics</h2>
<h3>Hayward Error Codes</h3>
<ul>
    <li><strong>LO (Lockout):</strong> Reset power, check gas valve operation, test flame sensor</li>
    <li><strong>SF (Switch Fault):</strong> Test pressure switch, verify pump operation</li>
</ul>
</section>
```

### 10.2 Authorization Value Messaging

**For Authorized Dealers:**
Emphasize manufacturer-specific benefits:
- Factory training on specific models
- Direct access to technical support hotlines
- Genuine OEM parts availability
- Warranty claim processing
- Software/firmware update access

**Example Integration:**
```html
<p>As an authorized Pentair, Hayward, and Raypak dealer, we maintain direct lines to factory technical support and receive training on model-specific troubleshooting procedures. This authorization means we can process warranty claims directly and source genuine parts overnight rather than waiting days for aftermarket alternatives.</p>
```

### 10.3 Competitive Differentiation Without Naming

**When Positioning Against Competitors:**
- Never mention competitors by name
- Use "other companies" or "some providers"
- Focus on unique value propositions
- Substantiate all comparative claims
- Maintain professional tone

**Examples:**
❌ **Poor:** "Unlike ABC Plumbing, we actually return calls"
✓ **Good:** "Our same-day callback guarantee ensures you connect with a licensed technician within 2 hours"

❌ **Poor:** "XYZ Company doesn't have factory training"
✓ **Good:** "Factory-trained technicians access manufacturer hotlines and genuine parts other providers can't source"

---

## Phase 11: Special Instructions and Edge Cases

### 11.1 When User Query is Ambiguous

If the brief lacks clarity:
1. Default to informational approach
2. Cover multiple interpretations
3. Use "Whether you're [scenario A] or [scenario B]"
4. Provide comprehensive coverage
5. Include broader FAQ section

### 11.2 When Topic Bridges YMYL/Non-YMYL

For borderline topics:
1. Err on side of caution
2. Use qualified language for health/safety aspects
3. Use confident language for service/business aspects
4. Clearly segment different types of information
5. Include appropriate disclaimers only where needed

### 11.3 When Local Information is Crucial

For highly local services:
1. Mention specific neighborhoods/areas
2. Reference local landmarks
3. Include regional weather patterns
4. Cite local regulations specifically
5. Use local terminology and phrases

### 11.4 When Comparing Against Competitors

For competitive positioning:
1. Never mention competitors by name
2. Use "other companies" or "some providers"
3. Focus on unique value propositions
4. Substantiate all comparative claims
5. Maintain professional tone

---

## Final Execution Notes

### Critical Success Factors

1. **Answer Search Intent Immediately:** Quick-answer section must directly address query
2. **Be Specific, Not Vague:** "Clean flame sensor monthly with steel wool" not "regular maintenance"
3. **Never Repeat:** Each point made ONCE - consolidate similar information
4. **Stay On Topic:** Every sentence must be semantically related
5. **Clear Context:** "dental implants" not just "implants" 
6. **Dynamic Structure:** Section order based on intent, not template
7. **Substantive Positioning:** Show superiority through facts, not claims  
8. **Click-Worthy Meta:** Description must entice clicks through psychology
9. **No Artificial Length:** Write exactly what's needed - 500 or 3000 words
10. **Natural Human Style:** Vary sentences, use contractions, be conversational
11. **One Point Per Sentence:** If you need "and" twice, split it
12. **Each Section Unique:** Different focus for each component/section
13. **Local Presence:** "Our trucks are near your neighborhood"
14. **YMYL Rules:** Follow ymyl.md when applicable
15. **WordPress Ready:** POST_TITLE becomes H1, no H1 in content
16. **Style Guide Compliance:** NO em-dashes, use Oxford commas, contractions required, numerals for numbers

### Writing Philosophy

The best blog articles:
- Answer questions completely
- Anticipate follow-up questions  
- Build trust through expertise
- Provide value before selling
- Make complex topics accessible
- Respect the reader's time
- Guide toward solutions
- Support the main service naturally

### Remember

- This is a blog post supporting a service page, not the service page itself
- Educational value comes first, conversion second
- Quality content ranks better than keyword-stuffed content
- User experience signals affect SEO
- Every article represents the brand
- Local expertise differentiates from national competitors
- The goal is to be genuinely helpful

### Execution in Claude Code

When running as a Claude Code agent:
1. Parse the brief to extract all required elements
2. Parse business credentials from inputs
3. Determine content classification (YMYL vs non-YMYL)
4. Load appropriate output-style guides into context
5. Select appropriate archetype and structure
6. Integrate real business credentials naturally throughout
7. Generate the article following all guidelines
8. Format output as JSON with all required fields
9. Save to `/output/[kebab-case-title].json`
10. Confirm successful creation with file path

**Using Business Credentials:**
- Never fabricate credentials - use only what's provided
- Distribute credentials naturally across the article
- Match credentials to relevant sections
- If specific data missing, use general language
- Example: If no review count given, don't mention reviews

**JSON Output Generation:**
```python
import json
from datetime import datetime

# Generate all content pieces
post_title = "Choosing Between Clear Coat and Colored Epoxy for Your Garage Floor"
meta_title = "Clear Coat vs Colored Epoxy Garage Floor | Windsor Guide"
meta_description = "Comparing clear coat and colored epoxy..."
meta_keywords = "clear coat garage floor, colored epoxy, garage floor coating, Windsor..."
html_content = "<p>CONCRETE SURFACES is Windsor's trusted...</p>"

# Create kebab-case slug from title
slug = post_title.lower()
slug = slug.replace(' ', '-').replace(':', '').replace(',', '')
slug = '-'.join(filter(None, slug.split('-')))  # Remove empty strings

# Build JSON output
output = {
    "post_title": post_title,
    "meta_title": meta_title,
    "meta_description": meta_description,
    "meta_keywords": meta_keywords,
    "post_content": html_content,
    "post_slug": slug,
    "brief_id": brief_id,
    "word_count": len(html_content.split()),
    "created_date": datetime.now().strftime("%Y-%m-%d"),
    "target_keyword": primary_keyword,
    "location": business_location
}

# Save as JSON
filename = f"/output/{slug}.json"
with open(filename, 'w', encoding='utf-8') as f:
    json.dump(output, f, indent=2, ensure_ascii=False)
    
print(f"Article successfully created at {filename}")
```

---

## Appendix: Quick Reference Examples

### WordPress-Ready Output Examples by Industry

**Plumbing - Emergency:**
```
POST_TITLE: Emergency Burst Pipe Repairs in Toronto - What to Do Right Now
META_TITLE: Burst Pipe Emergency Repair Toronto | 24/7 Plumber | Water Damage Prevention | Same Day Service
META_DESCRIPTION: Burst pipe flooding your home? Turn off main water valve immediately. Toronto emergency plumbers arrive in 45 minutes. Available 24/7. Call now for immediate help.
META_KEYWORDS: burst pipe repair Toronto, emergency plumber, water damage prevention, 24/7 plumbing service, main water valve, pipe leak repair, same day plumber, frozen pipe repair
---
<p>Toronto Premier Plumbing is the city's trusted 24/7 emergency plumber that responds within 45 minutes to prevent catastrophic water damage...</p>
```

**HVAC - Comparison:**
```
POST_TITLE: Choosing Between a Heat Pump and Furnace for Your Ontario Home
META_TITLE: Heat Pump vs Furnace Ontario 2025 | Energy Costs, Efficiency, Installation | Complete Comparison Guide
META_DESCRIPTION: Heat pumps can significantly reduce heating costs but require higher upfront investment than furnaces. See Ontario efficiency ratings and climate performance. Free quotes.
META_KEYWORDS: heat pump vs furnace Ontario, heating system comparison, heat pump efficiency, furnace costs, Ontario climate heating, HVAC installation, heating system efficiency, energy costs, winter heating
---
<p>ComfortZone HVAC is Ontario's leading heating specialist that helps homeowners choose the most efficient and cost-effective heating solution...</p>
```

**Pool Services - Technical:**
```
POST_TITLE: Pentair, Hayward & Raypak Pool Heater Troubleshooting: Brand-Specific Error Codes
META_TITLE: Pool Heater Error Codes | Pentair MasterTemp, Hayward H-Series, Raypak Troubleshooting | Factory Trained Service
META_DESCRIPTION: Decoding pool heater error codes? Factory-trained technicians explain Pentair, Hayward, and Raypak diagnostics. Authorized dealer with genuine parts. Same-day service.
META_KEYWORDS: Pentair pool heater repair, Hayward H-Series troubleshooting, Raypak error codes, MasterTemp diagnostics, pool heater not heating, Jandy JXi repair, factory trained technician, authorized dealer, pool heater error codes, IntelliTouch, AquaRite, genuine pool heater parts, warranty service, Max-E-Therm
---
<p>Executive Blue Pools is Collin County's factory-authorized dealer for Pentair, Hayward, Raypak, and Jandy pool heaters, providing brand-specific troubleshooting that generic service companies cannot match...</p>
```

**Roofing - Technical:**
```
POST_TITLE: Preventing Ice Dams on Chicago Roofs: Complete Winter Protection Guide
META_TITLE: Ice Dam Prevention and Removal | Winter Roof Protection Chicago | Heat Cables, Insulation, Ventilation
META_DESCRIPTION: Ice dams cause thousands in average roof damage each winter. Learn prevention through proper insulation, ventilation, and heat cables. Chicago experts explain solutions.
META_KEYWORDS: ice dam prevention Chicago, roof ice dam removal, heat cables, attic insulation, roof ventilation, winter roof damage, ice dam protection, Chicago roofing, roof ice prevention
---
<p>Chicago Roofing Pros is the city's winter roofing specialist that protects homes from costly ice dam damage through proven prevention strategies...</p>
```

### Example Opening with WordPress Format

```
POST_TITLE: Choosing Between Clear Coat and Colored Epoxy for Your Garage Floor
META_TITLE: Clear Coat vs Colored Epoxy: Best Garage Floor Options Windsor Ontario | Durability & Aesthetics Guide
META_DESCRIPTION: Comparing clear coat and colored epoxy for garage floors? Learn which option best preserves concrete beauty or hides imperfections. Windsor installation experts explain your options.
META_KEYWORDS: clear coat garage floor, colored epoxy, garage floor coating, epoxy flooring Windsor, concrete coating comparison, UV resistant coating, polyaspartic topcoat, garage floor aesthetics, floor protection, concrete preservation
---
<p>CONCRETE SURFACES is Windsor's trusted garage floor coating specialist that helps homeowners choose between preservation and transformation for lasting floor protection. The decision between clear coat and colored epoxy affects not just how your garage looks, but how it performs over the next 15-20 years. Through our <a href="[SERVICE_URL]">professional epoxy flooring services</a>, we've helped hundreds of Windsor homeowners make this choice based on their concrete's condition, design preferences, and long-term goals.</p>

<p>Clear coat epoxy preserves and enhances your concrete's natural character, creating a glossy, showroom-quality finish that many homeowners love for its sophisticated appearance. This option works best when your concrete is in excellent condition without significant staining, cracks, or patches that need concealing.</p>

<section id="comparison-overview">
    <h2>Understanding Your Options: Clear Coat and Colored Epoxy</h2>
    [Article continues with NO additional links and NO H1 tag...]
</section>
```

---

*End of Strategy Document*

*This framework ensures consistent, high-quality blog content across any service industry while maintaining SEO best practices and serving user intent effectively.*